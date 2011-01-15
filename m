Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PeEJV-0005Nb-Gc
	for linux-mtd@lists.infradead.org; Sat, 15 Jan 2011 22:09:38 +0000
Received: by fxm19 with SMTP id 19so4244366fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 15 Jan 2011 14:09:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTikhFt32NA9Lhzh0LDCzQmem3tjJZTG1TnP6ugnK@mail.gmail.com>
References: <AANLkTikGddyMhxph92Dz7vpRNRKa2haQne7yxKBTKw3N@mail.gmail.com>
	<AANLkTikhFt32NA9Lhzh0LDCzQmem3tjJZTG1TnP6ugnK@mail.gmail.com>
Date: Sat, 15 Jan 2011 22:09:34 +0000
Message-ID: <AANLkTinyjaXqfWBSXzG2jg8wWiVbXA6ZhZ=RUgtue=qO@mail.gmail.com>
Subject: Re: validate_sb: bad superblock, error 8 (Minimum UBI volume size for
	UBIFS image)
From: Andrew Murray <amurray@mpcdata.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15 January 2011 10:48, Andrew Murray <amurray@mpcdata.com> wrote:
> On 11 January 2011 09:47, Andrew Murray <amurray@mpcdata.com> wrote:
>>
>> Is there a way to determine the minimum UBI volume size which will
>> support a given UBIFS filesystem image?
>>
>
> My conclusion is this (with my version of kernel and mkfs.ubifs tool):
>
> (Min No. UBI Volume LEBS) = (jrn_lebs) + 3 + (log lebs) + (lpt_lebs) +
> (orph_lebs)
>
> And these values can all be determined (or specified) by the
> mkfs.ubifs tool by using the verbose -v flag.
>
> This seems to hold true - Does this seem reasonable?

After reading the ODP presentation, white paper and reading the source
- I do not understand the purpose of the second condition in the
following test case in validate_sb:

        if (c->max_bud_bytes < (long long)c->leb_size * UBIFS_MIN_BUD_LEBS ||
            c->max_bud_bytes > (long long)c->leb_size * c->main_lebs

It seems to be asserting that there is enough space on the volume to
cater for the maximum size of the journal. However in the case where
the UBI volume is similar in size to the UBIFS image data -
'main_lebs' will mostly be absent of free space lebs. Therefore there
may not be enough room for max_bud_bytes amounts of journal. And in
any case the journal code seems to cater well for there not being
enough free lebs. (Presumably it copes when the volume is nearly
full).

Therefore is this condition superfluous?

Thanks,

Andrew Murray
