Received: from mail-yx0-f204.google.com ([209.85.210.204])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NykrV-0005TG-Qa
	for linux-mtd@lists.infradead.org; Mon, 05 Apr 2010 11:53:02 +0000
Received: by yxe42 with SMTP id 42so2296441yxe.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Apr 2010 04:52:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <04513CE719AF46EDACC26900E39ED2F2@sisodomain.com>
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<3E83C7DF574149B78FFE8D12094FAF6D@sisodomain.com>
	<1244808209.5847.447.camel@localhost.localdomain>
	<5156D5DBD34A4A5984AE3F3840C0452F@sisodomain.com>
	<1244813557.3511.1272.camel@macbook.infradead.org>
	<42F6638D897B4BA7B729CBC244D9F6E4@sisodomain.com>
	<1245698113.25547.229.camel@macbook.infradead.org>
	<E19B9A1D84D0455981E564D51B3C641F@sisodomain.com>
	<p2r62cbdcd91003310607g3507fb29gd8ecddf3d3a3dfaa@mail.gmail.com>
	<04513CE719AF46EDACC26900E39ED2F2@sisodomain.com>
Date: Mon, 5 Apr 2010 13:52:59 +0200
Message-ID: <h2u62cbdcd91004050452o6c30aa38tee35c2a41b7f4bd5@mail.gmail.com>
Subject: Re: MLC Support in JFFS2
From: massimo cirillo <maxcir@gmail.com>
To: Amul Kumar Saha <amul.saha@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Amit Kumar Sharma <amitsharma.9@samsung.com>, dedekind@infradead.org,
	kyungmin.park@samsung.com, apgmoorthy <moorthy.apg@samsung.com>,
	linux-mtd@lists.infradead.org, raghav.gupta@samsung.com,
	v.dalal@samsung.com, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok,
but at the remount how do you verify if the TOKEN_BLOCK
is updated or not (in case of power loss) ? I suggest using
a commit mark (one page wasted) at the end of the update
procedure.
So you'll have in the TOKEN_BLOCK the following layout:

MAGIC_NUMBER of the TOKEN_BLOCK
ready_to_use info
commit mark

What do you think ?

2010/4/5 Amul Kumar Saha <amul.saha@samsung.com>:
> Hi,
>
>>> 3. Write the TOKEN_BLOCK's MAGIC_NUMBER in the OOB Area alongwith the
>>> =A0ready_to_use info, in the Main Area.
>> I think you should protect each ready_to_use block info in the TOKEN_BLO=
CK
>> with a CRC - as it was a node of JFFS2 - against power loss corruption.
>>
>
> Sure, I'll take that into account.
>
>>> 4. On next update, ask GC to provide a fresh block.
>> What do you mean ? Each time a block is erased do you
>> update the TOKEN_BLOCK by using a new one ?
>>
>
> No.
> That would be done only during a proper unmount or idle time.
> As this block just contains ready_to_use block info,
> that can be reconstructed, on remount.
> Because any updation on fixed intervals will not be of use.
> Neither will it be feasbale to update the TOKEN_BLOCK on every erase.
> Please do comment.
>
> Regards,
> Amul
>
>
>
