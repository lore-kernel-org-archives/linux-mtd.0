Received: from mail-gx0-f221.google.com ([209.85.217.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NwxeA-00070x-Qm
	for linux-mtd@lists.infradead.org; Wed, 31 Mar 2010 13:07:51 +0000
Received: by gxk21 with SMTP id 21so57486gxk.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 Mar 2010 06:07:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <E19B9A1D84D0455981E564D51B3C641F@sisodomain.com>
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<2AF67696C6634054B7CFDF7A9C19865D@sisodomain.com>
	<1244803363.5847.446.camel@localhost.localdomain>
	<3E83C7DF574149B78FFE8D12094FAF6D@sisodomain.com>
	<1244808209.5847.447.camel@localhost.localdomain>
	<5156D5DBD34A4A5984AE3F3840C0452F@sisodomain.com>
	<1244813557.3511.1272.camel@macbook.infradead.org>
	<42F6638D897B4BA7B729CBC244D9F6E4@sisodomain.com>
	<1245698113.25547.229.camel@macbook.infradead.org>
	<E19B9A1D84D0455981E564D51B3C641F@sisodomain.com>
Date: Wed, 31 Mar 2010 15:07:48 +0200
Message-ID: <p2r62cbdcd91003310607g3507fb29gd8ecddf3d3a3dfaa@mail.gmail.com>
Subject: Re: MLC Support in JFFS2
From: massimo cirillo <maxcir@gmail.com>
To: Amul Kumar Saha <amul.saha@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Amit Kumar Sharma <amitsharma.9@samsung.com>, dedekind@infradead.org,
	apgmoorthy <moorthy.apg@samsung.com>, kyungmin.park@samsung.com,
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

Hi Amul,

> 3. Write the TOKEN_BLOCK's MAGIC_NUMBER in the OOB Area alongwith the
>  ready_to_use info, in the Main Area.
I think you should protect each ready_to_use block info in the TOKEN_BLOCK
with a CRC - as it was a node of JFFS2 - against power loss corruption.

> 4. On next update, ask GC to provide a fresh block.
What do you mean ? Each time a block is erased do you
update the TOKEN_BLOCK by using a new one ?
