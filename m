Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=TX2EHSOBE002.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RzgFx-0007Fu-8g
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2012 03:19:10 +0000
Message-ID: <4F430DA5.9040003@freescale.com>
Date: Tue, 21 Feb 2012 11:21:09 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: use the full-id string as the keyword to search
 the id table
References: <1329476273-14381-1-git-send-email-b32955@freescale.com>
 <CAN8TOE92WVD0Z6e7WtyUp4gD4XN9EwFBXwg8Y9UPcpoQQEzBnQ@mail.gmail.com>
In-Reply-To: <CAN8TOE92WVD0Z6e7WtyUp4gD4XN9EwFBXwg8Y9UPcpoQQEzBnQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Brian:
> On Fri, Feb 17, 2012 at 2:57 AM, Huang Shijie<b32955@freescale.com>  wrote:
>> There are many nand chips.
>> The followings are the reasons why i send this patch, take Hynix's nands for example:
>>
>> [1] Diffrent Hynix's nands may use different methods to parse the id
>>     string. H27UBG8T2A uses one method, while HY27UW08CGFM uses another.
>>     If we code each parsing function for each NAND, we will feel frustrated.
> This reason is mostly valid, although I don't think it's a good enough
> argument for not *trying* to parse according to the tables, when they
> are provided. I didn't notice before that H27UBG8T2A actually provided
> a parse table; it may be worth trying to use this for parsing at some
> point, since Hynix may produce new chips that follow this pattern and
I hope so.  :)


> can have zero-day support that way.
>
> Still, we *do* need the full 8-byte ID table for some chips.
Yes, we can still add them to the lagacy table.
>> [2] The same Device ID.
>>     It's common that two nands shares the same Device ID.
>>     How to distinguish the two nands? The only way is to use the full id
> s/The only way/One way/
>
>>     string as the keyword.
> I would contend that it's not the *only* way. In fact, we already have
> a few mechanisms for chips with different device IDs that can have
I think the key issue is to handle the _same_ device IDs.

> some different properties. But this is mostly a nitpick in wording,
> since I still agree that attempting "generic parsing" is not practical
> for some cases.
>
>> So add some new fields to nand_flash_dev{}:
>>     @id[8]  : extend this field to an array to store the full id data.
>>     @id_len : Some nands use 8 bytes as id data, while some use 5 or 6.
>>     @oobsize: The oob size of this nand.
> We will need a bbt_options field for some new chips, since bad block
> scanning info is similarly non-decodable. There may be other important
> info that we will need (not sure right now).
>
>> With this patch, during the scanning, the kernel will first checks
>> the nand_flash_full_ids, then the lagacy nand_flash_ids,
>> and the last to check whether it is an ONFI nand.
> This does not match your code. In fact, you have left it like this:
> (1) check nand_flash_full_ids[]
> (2) match with legacy nand_flash_ids[] (but don't decode yet)
> (3) check ONFI
> (4) decode from nand_flash_ids[]
>
> However, if your patch *did* follow what your comment said, then this
> would break a lot of current detection, since we do not want ONFI to
> be the last resort.
sorry for the wrong comment.
> Do you have a particular reason why the nand_flash_full_ids[] and
> nand_flash_ids[] tables can't be merged, and (1) (2) and (4) performed
The particular reason is we can not get the right chipsize when two
same Device ids appears.

We can not get the right chipsize from H27UBG8T2A's ID data. There is
already a 0xd7 device id in the nand_flash_ids table.



> only after the ONFI detection? We simply order the "full ID" entries
> first in the table, so that if they match, then we break out of our


I ever thought this method too,  It does works too.
But  it makes the nand_flash_ids mess in logic. The full ID entries 
stands for single nands, while
the others stand for a class of nands.  Is the "mess in logic" 
acceptable to us?

I do not object this method, If Artem also agrees this method, I can 
change the patch.



> loop. With no match, we eventually progress to the legacy ID entries
> as before (which could be identified by the lack of blocksize or
> pagesize entry ... or something like that). Let's flesh this out
> before committing to a new mechanism.
>
> Also, would it be useful to have some kind of mask for the ID, so that
> chips that are identical, apart from some specific wildcard ID
> byte(s), can be classified under a single entry? (like a wildcard
> byte) Just a suggestion that may prove useful as the table is more
> heavily used; not necessarily an immediate need.
>
> And I didn't check too closely, but I think HY27UT088G2M (and maybe
> HY27UW08CGFM?) should be supported by the ID decoding and don't need
> new table entries.
>
We can not get the right chipsize for them.
> Lastly, I think that this patch should be split a little. Converting
> to a new table format, adding detection mechanisms, and adding entries
> for new chips should all be separate patches.
ok. thanks


Huang Shijie
> Brian
>
