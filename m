From: David Woodhouse <dwmw2@infradead.org>
To: "Rajesh B. V." <rajeshbv@intotoinc.com>
In-Reply-To: <5.1.0.14.0.20040325143833.01b20e50@172.16.1.10>
References: <5.1.0.14.0.20040325143833.01b20e50@172.16.1.10>
Content-Type: text/plain
Message-Id: <1080205651.29835.1.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 25 Mar 2004 09:07:32 +0000
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

On Thu, 2004-03-25 at 14:45 +0530, Rajesh B. V. wrote:
> Hi All,
> 
> I mounted JFFS2 file system through device 'mtdblock4' on my ARM target.
> I need to update some files ( kind of configuration files ) periodically in 
> the JFFS2 partition.
> For this i create the files in RAM and just copy the files from RAM to 
> JFFS2, overwriting the previous files.

Are you removing the old files first, or writing the new files with
different names and then renaming them to the same name as the original
files? Or are you opening the original files with O_TRUNC?

Are there any processes running which still have the old file open?

-- 
dwmw2
