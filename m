Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HOqCX-0001j1-GJ
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 02:04:42 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Support for Large Flash Designs
Date: Wed, 7 Mar 2007 20:09:23 +1300
References: <B1EDF20A6EAAD74EA65E46F774F17845FD5CF5@orsmsx413.amr.corp.intel.com>
	<45EE6012.1040506@ru.mvista.com>
In-Reply-To: <45EE6012.1040506@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703072009.23430.manningc2@actrix.gen.nz>
Cc: Vitaly Wool <vwool@ru.mvista.com>, "Johnson,
	Charles F" <charles.f.johnson@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 07 March 2007 19:47, Vitaly Wool wrote:
> Johnson, Charles F wrote:
> >My understanding is that JFFS2 does not support flash file systems
> >larger than 4GB.  What would be the issues with supporting more than 4GB
> >of NAND flash.
>
> Excuse me for the stupid (probably) question, but still: are you sure
> you want to use a single 4GB partition for read/write operations??

I think that for many applications a large partition is preferable to many 
small ones.

If you think of something simple like an MP3 player or such, the user does not 
want to split up their data according to partitions. Partitions just provide 
an artificial constraint that is confusing to many people.

-- Charles
