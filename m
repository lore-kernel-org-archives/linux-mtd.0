Subject: RE: MLC Support in JFFS2
From: David Woodhouse <dwmw2@infradead.org>
To: apgmoorthy <moorthy.apg@samsung.com>
In-Reply-To: <AECB2B7C3BFE41EF9C53455593C2372C@sisodomain.com>
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
	<9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
	<1244712906.5847.414.camel@localhost.localdomain>
	<2AF67696C6634054B7CFDF7A9C19865D@sisodomain.com>
	<1244803363.5847.446.camel@localhost.localdomain>
	<3E83C7DF574149B78FFE8D12094FAF6D@sisodomain.com>
	<1244808209.5847.447.camel@localhost.localdomain>
	<5156D5DBD34A4A5984AE3F3840C0452F@sisodomain.com>
	<1244813557.3511.1272.camel@macbook.infradead.org>
	<42F6638D897B4BA7B729CBC244D9F6E4@sisodomain.com>
	<1245698113.25547.229.camel@macbook.infradead.org>
	<AECB2B7C3BFE41EF9C53455593C2372C@sisodomain.com>
Content-Type: text/plain
Date: Tue, 23 Jun 2009 14:19:37 +0100
Message-Id: <1245763177.25547.2350.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'Amit Kumar Sharma' <amitsharma.9@samsung.com>, vishak.g@samsung.com,
	'Amul Saha' <amul.saha@samsung.com>, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Your mail program is behaving very strangely -- your quotes are quite
hard to read. Is there any chance you could use a better one? I've tried
to clean it up, but it tends to make your replies hard to read. Some of
your replies are lacking correct References: headers too, so the
threading is broken.

On Tue, 2009-06-23 at 18:22 +0530, apgmoorthy wrote:
> >There was a reason for the cleanmarker -- it saved us from using 
> > partly-erased blocks for data. Do you have some other way to
> > guarantee that this won't happen?
>
> - How about the second One (Refer Below Links), which leaves
> 1page/block for Cleanmarker.
> 
> http://lists.infradead.org/pipermail/linux-mtd/2008-September/023101.html   http://lists.infradead.org/pipermail/linux-mtd/2008-September/023044.html 

Using one page per block for the cleanmarker would work, but seems
wasteful. I can think of one more approach which we might take -- erase
blocks only as we need them.

So instead of erasing blocks without cleanmarker _immediately_ on
startup, we just put them on a 'to be erased' list. Whenever the
empty_list is getting short of blocks, we erase another block from the
'to be erased' list and move it to the empty list.

It does mean that if you keep rebooting over and over again, you're
probably going to increase your erase count. But with a long-lived
system, it's likely to be more efficient than the large cleanmarker?

What do you think?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
