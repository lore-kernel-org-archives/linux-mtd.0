Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
From: David Woodhouse <dwmw2@infradead.org>
To: carsteno@de.ibm.com
In-Reply-To: <48AD2AFF.5060609@de.ibm.com>
References: <48AD00F8.1030004@gmail.com>  <48AD2AFF.5060609@de.ibm.com>
Content-Type: text/plain
Date: Thu, 21 Aug 2008 09:49:19 +0100
Message-Id: <1219308560.2988.247.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, linux-embedded@vger.kernel.org,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@AM.SONY.COM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-08-21 at 10:44 +0200, Carsten Otte wrote:
> Jared Hulbert wrote:
> > Profiling is a fault instrumentation and /proc formating system.
> > This is used to get an accurate picture of what the pages are actually used.
> > Using this info the image can be optimized for XIP

> Exporting profiling data for a file system in another file system 
> (/proc) seems not very straigtforward to me. I think it is worth 
> considering to export this information via the same mount point.

I would have said sysfs, rather than 'the same mount point'.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
