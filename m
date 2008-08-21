Received: from rex.securecomputing.com ([203.24.151.4] helo=cyberguard.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KWJuA-0007gn-3w
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 23:49:26 +0000
Message-ID: <48ADFE65.1050007@snapgear.com>
Date: Fri, 22 Aug 2008 09:46:45 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
In-Reply-To: <20080821110749.GA1926@shareable.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
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


Jamie Lokier wrote:
> Jared Hulbert wrote:
>> The biggest improvement is in the way AXFS allows for each page to be XIP or
>> not.  First, a user collects information about which pages are accessed on a
>> compressed image for each mmap()ed region from /proc/axfs/volume0.  That
>> 'profile' is used as an input to the image builder.  The resulting image has
>> only the relevant pages uncompressed and XIP.  The result is smaller memory
>> sizes and faster launches.
> 
> Sounds great, really nice idea.
> 
> How does it fare with no MMU?  Can the profiler and image builder lay
> out the XIP pages in such a way that no-MMU mmaps can map those regions?

The key for XIP on noMMU would be the ability to store a
file as one complete contiguous chunk. Can AXFS do this?

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
Secure Computing Corporation                PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
