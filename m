From: David Woodhouse <dwmw2@infradead.org>
To: "Rajesh B. V." <rajeshbv@intotoinc.com>
In-Reply-To: <5.1.0.14.0.20040325161533.030dd948@172.16.1.10>
References: <5.1.0.14.0.20040325143833.01b20e50@172.16.1.10>
	 <5.1.0.14.0.20040325143833.01b20e50@172.16.1.10>
	 <5.1.0.14.0.20040325161533.030dd948@172.16.1.10>
Content-Type: text/plain
Message-Id: <1080211172.29835.40.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 25 Mar 2004 10:39:33 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Running out of space on MTD partition with JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-03-25 at 16:18 +0530, Rajesh B. V. wrote:
> Hi David,
> 
> Thanks for the response.
> 
> >Are you removing the old files first, or writing the new files with
> >different names and then renaming them to the same name as the original
> >files? Or are you opening the original files with O_TRUNC?
> 
> I am overwriting the old files with new files ( with same name directly ) 
> using simple 'cp'
> # cp -f /config  /mnt/jffs2  ( where /mnt/jffs2 is mounted through 
> /dev/mtdblock4 ).
> 
> >Are there any processes running which still have the old file open?
> 
> There are no other processes using these files once copy is done. Only 
> during bootup and during taking backup only these files will be accessed.

Ok. How big is the partition, how big is the config file and what else
is on the partition? Can you show me the output of 'df' when you start,
and when you do this a few times? If you remove the old file first, what
does 'df' say then, before you write the new one?

-- 
dwmw2
