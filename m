From: David Woodhouse <dwmw2@infradead.org>
To: "Rajesh B. V." <rajeshbv@intotoinc.com>
In-Reply-To: <5.1.0.14.0.20040325181511.01b26820@172.16.1.10>
References: <5.1.0.14.0.20040325161533.030dd948@172.16.1.10>
	 <5.1.0.14.0.20040325143833.01b20e50@172.16.1.10>
	 <5.1.0.14.0.20040325143833.01b20e50@172.16.1.10>
	 <5.1.0.14.0.20040325161533.030dd948@172.16.1.10>
	 <5.1.0.14.0.20040325181511.01b26820@172.16.1.10>
Content-Type: text/plain
Message-Id: <1080224234.29835.65.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 25 Mar 2004 14:17:14 +0000
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

On Thu, 2004-03-25 at 18:16 +0530, Rajesh B. V. wrote:
> Hi David,
> 
> Pl. find the output of "df -h" after every copy and the file sizes also, 
> copied below.

Hmmm. Strange -- what else is on the file system in question? What does
'du -s /mnt/jffs2' show each time?

JFFS2 isn't really designed to work on such small partitions, but it
ought to be behaving better than it is.

-- 
dwmw2
