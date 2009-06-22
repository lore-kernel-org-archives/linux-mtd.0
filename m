Subject: Re: MLC Support in JFFS2
From: David Woodhouse <dwmw2@infradead.org>
To: apgmoorthy <moorthy.apg@samsung.com>
In-Reply-To: <42F6638D897B4BA7B729CBC244D9F6E4@sisodomain.com>
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
Content-Type: text/plain
Date: Mon, 22 Jun 2009 20:15:13 +0100
Message-Id: <1245698113.25547.229.camel@macbook.infradead.org>
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

On Fri, 2009-06-19 at 12:20 +0530, apgmoorthy wrote:
> Hi David,
> 
> Currenlty , Is there a way to use JFFS2 with MLC Memories ( NOP == 1 )?
> 
> If not , Felt that any one of the following patch can be of use
> 
> 1. http://lists.infradead.org/pipermail/linux-mtd/2007-December/020047.html
>           - Which removes the Clean Marker.

There was a reason for the cleanmarker -- it saved us from using
partly-erased blocks for data. Do you have some other way to guarantee
that this won't happen?

(Sorry, I think we may have had this discussion before, but I've
forgotten the conclusion, if there was one. It was academic at the time,
since we didn't have any solution for the paired-page insanity anyway. I
was mostly just burying my head in the sand and hoping this stupid 'MLC'
crap would go away.)

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
