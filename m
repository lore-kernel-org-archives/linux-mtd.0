Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RzdtZ-0005uw-Ml
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2012 00:47:55 +0000
Received: by ggnf2 with SMTP id f2so3031636ggn.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Feb 2012 16:47:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1329476273-14381-1-git-send-email-b32955@freescale.com>
References: <1329476273-14381-1-git-send-email-b32955@freescale.com>
Date: Mon, 20 Feb 2012 16:47:50 -0800
Message-ID: <CAN8TOE92WVD0Z6e7WtyUp4gD4XN9EwFBXwg8Y9UPcpoQQEzBnQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: use the full-id string as the keyword to search the
 id table
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie8@gmail.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, ffainelli@freebox.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 17, 2012 at 2:57 AM, Huang Shijie <b32955@freescale.com> wrote:
> There are many nand chips.
> The followings are the reasons why i send this patch, take Hynix's nands =
for example:
>
> [1] Diffrent Hynix's nands may use different methods to parse the id
> =A0 =A0string. H27UBG8T2A uses one method, while HY27UW08CGFM uses anothe=
r.
> =A0 =A0If we code each parsing function for each NAND, we will feel frust=
rated.

This reason is mostly valid, although I don't think it's a good enough
argument for not *trying* to parse according to the tables, when they
are provided. I didn't notice before that H27UBG8T2A actually provided
a parse table; it may be worth trying to use this for parsing at some
point, since Hynix may produce new chips that follow this pattern and
can have zero-day support that way.

Still, we *do* need the full 8-byte ID table for some chips.

> [2] The same Device ID.
> =A0 =A0It's common that two nands shares the same Device ID.
> =A0 =A0How to distinguish the two nands? The only way is to use the full =
id

s/The only way/One way/

> =A0 =A0string as the keyword.

I would contend that it's not the *only* way. In fact, we already have
a few mechanisms for chips with different device IDs that can have
some different properties. But this is mostly a nitpick in wording,
since I still agree that attempting "generic parsing" is not practical
for some cases.

> So add some new fields to nand_flash_dev{}:
> =A0 =A0@id[8] =A0: extend this field to an array to store the full id dat=
a.
> =A0 =A0@id_len : Some nands use 8 bytes as id data, while some use 5 or 6=
.
> =A0 =A0@oobsize: The oob size of this nand.

We will need a bbt_options field for some new chips, since bad block
scanning info is similarly non-decodable. There may be other important
info that we will need (not sure right now).

> With this patch, during the scanning, the kernel will first checks
> the nand_flash_full_ids, then the lagacy nand_flash_ids,
> and the last to check whether it is an ONFI nand.

This does not match your code. In fact, you have left it like this:
(1) check nand_flash_full_ids[]
(2) match with legacy nand_flash_ids[] (but don't decode yet)
(3) check ONFI
(4) decode from nand_flash_ids[]

However, if your patch *did* follow what your comment said, then this
would break a lot of current detection, since we do not want ONFI to
be the last resort.

Do you have a particular reason why the nand_flash_full_ids[] and
nand_flash_ids[] tables can't be merged, and (1) (2) and (4) performed
only after the ONFI detection? We simply order the "full ID" entries
first in the table, so that if they match, then we break out of our
loop. With no match, we eventually progress to the legacy ID entries
as before (which could be identified by the lack of blocksize or
pagesize entry ... or something like that). Let's flesh this out
before committing to a new mechanism.

Also, would it be useful to have some kind of mask for the ID, so that
chips that are identical, apart from some specific wildcard ID
byte(s), can be classified under a single entry? (like a wildcard
byte) Just a suggestion that may prove useful as the table is more
heavily used; not necessarily an immediate need.

And I didn't check too closely, but I think HY27UT088G2M (and maybe
HY27UW08CGFM?) should be supported by the ID decoding and don't need
new table entries.

Lastly, I think that this patch should be split a little. Converting
to a new table format, adding detection mechanisms, and adding entries
for new chips should all be separate patches.

Brian
