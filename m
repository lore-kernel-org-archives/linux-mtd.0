Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pk51J-0005SI-00
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2011 01:27:01 +0000
Received: by gxk21 with SMTP id 21so2355665gxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Jan 2011 17:26:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1296322698.2400.10.camel@localhost>
References: <AANLkTilwqK96Btosh4kzW0kMDjRWzWskrG_ymekpV9Uz@mail.gmail.com>
	<1278995289.16634.126.camel@localhost>
	<1278995528.16634.129.camel@localhost>
	<AANLkTi==-biDcaFozVvkHUwXMYqMWk4=mbD16_TJ1JOO@mail.gmail.com>
	<1296322698.2400.10.camel@localhost>
Date: Mon, 31 Jan 2011 20:26:59 -0500
Message-ID: <AANLkTikfW_KDcBcJZ8RFq=v1CvRtdmjAVB8yQ_kQEP9F@mail.gmail.com>
Subject: Re: ubifs_scan() error handling
From: twebb <taliaferro62@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> It's been awhile but I wanted to reopen the discussion on this topic.
>> Could you take a look at this proposed patch? =A0Essentially this change
>> results in the LEB being cleaned/recovered regardless of whether
>> is_last_write() is true or not. =A0There may be a better way to do this
>> earlier in the same function, but I'm not familiar enough with it to
>> know the significance of the is_last_write() call.
>
> But I think I explained why this check is there. Why exactly it does not
> work for your flash? I think you need to get better understanding what
> is happening in your case. I am reluctant to take this patch because it
> is more of a band-aid but not a proper solution.
>

I don't recall an explanation about why that check is there, but
regardless, I'll try to explain why things are failing on my flash:

Let's take the case of a read or write disturb error causing multiple
bit flips in the empty space of a LEB (not in the common header node
magic number location).  I believe this type of error is very common
with MLC (since ECC will generally handle bit flips in non-FF areas.)

LEB: | good nodes | 0xFFs | bit flip | 0xFFs | bit flip | 0xFFs|

When ubifs_recover_leb() calls ubifs_scan_a_node(), it correctly
returns SCANNED_EMPTY_SPACE.  Then ubifs_recover_leb() finds that the
LEB buf is not empty.  It also finds that !is_last_write() is TRUE and
breaks without setting empty_chkd.  Later, as a result of !empty_chkd
and !is_empty and !is_last_write all being TRUE, the LEB is marked as
corrupted.  This ultimately may result in a failure to mount or in a
RO mount.

However, because of the nature of the "corruption", if
ubifs_recover_leb() ignores is_last_write() result and instead calls
clean_buf() and sets need_clean =3D 1, then fix_unclean_leb() ultimately
fixes the bit flip via the ubi_leb_change() call and without data
loss.

Does this make sense or is my logic wrong?  I think it's OK assuming
that no true corruption (associated with a power loss) happens in
conjunction with the rd/wr disturb.

I do understand that perhaps this is more a band-aid than a proper
solution.  However, I'm trying to understand whether it is reasonable
and whether you think it does more good than harm.

twebb
