Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O0AOf-00035c-Lc
	for linux-mtd@lists.infradead.org; Fri, 09 Apr 2010 09:21:06 +0000
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0L0L004M4RB0CS@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 09 Apr 2010 18:21:01 +0900 (KST)
Received: from amulsaha ([107.108.214.58])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L0L00KP6RAYGB@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 09 Apr 2010 18:21:00 +0900 (KST)
Date: Fri, 09 Apr 2010 14:51:25 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: MLC Support in JFFS2
To: massimo cirillo <maxcir@gmail.com>
Message-id: <980E75202FF04069AAE27686AB103C09@sisodomain.com>
Content-transfer-encoding: 7BIT
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
	<h2u62cbdcd91004050452o6c30aa38tee35c2a41b7f4bd5@mail.gmail.com>
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

Hi,


>Ok,
>but at the remount how do you verify if the TOKEN_BLOCK
>is updated or not (in case of power loss) ? I suggest using
>a commit mark (one page wasted) at the end of the update
>procedure.
>So you'll have in the TOKEN_BLOCK the following layout:
>
>MAGIC_NUMBER of the TOKEN_BLOCK
>ready_to_use info
>commit mark
>
>What do you think ?
>

Yes.
However, the TOKEN_BLOCK update would then
only be limited to mount and unmount.
As writing a commit mark while the system is still running,
would validate an invalid block on abrupt power-off.

Regards,
Amul 
