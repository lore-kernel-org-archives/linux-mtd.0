Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeEpK-000420-Ng
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2011 23:14:48 +0000
Received: by vxd3 with SMTP id 3so5680670vxd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Jul 2011 16:14:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110705180138.469f34d1@schlenkerla.am.freescale.net>
References: <20110705151525.438e87dc@schlenkerla.am.freescale.net>
	<1309905302-1990-1-git-send-email-mlcreech@gmail.com>
	<20110705180138.469f34d1@schlenkerla.am.freescale.net>
Date: Tue, 5 Jul 2011 19:14:38 -0400
Message-ID: <CAPBSBxr00GC1deSam9kSrgyju=-5VX-t+5skBVNmBXVZD4BO6g@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: eLBC NAND: remove elbc_fcm_ctrl->oob_poi
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	mhench@elutions.com, rick22@wi.rr.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 5, 2011 at 7:01 PM, Scott Wood <scottwood@freescale.com> wrote:
>
> Just noticed, full_page can come out as well.
>
> Otherwise, ACK
>

Oh right, didn't notice that - thanks.

-- 
Matthew L. Creech
