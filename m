Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M3tJ-0007Xq-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 09:38:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010716095942.A21213@crystal.2d3d.co.za> 
References: <20010716095942.A21213@crystal.2d3d.co.za>  <H00002af04ff19c1@MHS> 
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: kingseft@samsung.co.kr,
    MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: =?iso-8859-1?Q?=28=C0=E7=C0=FC=BC=DB=29_=2Fdev=2Fmtd0_qeustions?= 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 16 Jul 2001 09:42:55 +0100
Message-ID: <15515.995272975@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

abraham@2d3d.co.za said:
>  btw, if you want to copy to a raw partition (as you did above),
> you'll have to erase that partition first.

Or use the mtdblock device instead, which does erase it for you.



--
dwmw2
