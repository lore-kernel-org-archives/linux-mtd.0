Received: from mx0b-00010702.pphosted.com ([148.163.158.57])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dB3C4-0002nw-KU
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 17:57:07 +0000
Date: Wed, 17 May 2017 12:55:47 -0500
From: Zach Brown <zach.brown@ni.com>
To: Honza =?utf-8?Q?Petrou=C5=A1?= <jpetrous@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 cyrille.pitchen@atmel.com, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RESEND PATCH v3] UBI: add debugfs file for tracking PEB state
Message-ID: <20170517175546.GA7493@zach-desktop>
References: <1494957488-31427-1-git-send-email-zach.brown@ni.com>
 <56b1f2d2-d368-895b-d3fc-0edd729e5863@nod.at>
 <CAJbz7-2D4ZVyWcC+bx5aFMS7FjRWX-_AWyKODt4civz4fJverg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJbz7-2D4ZVyWcC+bx5aFMS7FjRWX-_AWyKODt4civz4fJverg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 17, 2017 at 12:36:35PM +0200, Honza Petrouš wrote:
> 2017-05-16 20:22 GMT+02:00 Richard Weinberger <richard@nod.at>:
> > Zach,
> >
> > Am 16.05.2017 um 19:58 schrieb Zach Brown:
> >> From: Ben Shelton <ben.shelton@ni.com>
> >>
> >> Add a file under debugfs to allow easy access to the erase count for
> >> each physical erase block on an UBI device.  This is useful when
> >> debugging data integrity issues with UBIFS on NAND flash devices.
> >>
> >> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> >> Signed-off-by: Zach Brown <zach.brown@ni.com>
> >
> > Hmmm, I thought I applied this to my v4.12 queue, but seems
> > like I didn't. So, it will be part of v4.13.
> > I'm very sorry, please accept my apologies.
> 
> Yes, you did it - at least my Linus' github repo clone has it already
> = 7bccd12d27b7e358823feb5429731b8ee698b173
> 
> /Honza

My mistake then. My apologies for the confusion. Thank you for noticing.
