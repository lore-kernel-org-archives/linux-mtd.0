From: Thomas Gleixner <tglx@linutronix.de>
To: Pankaj GOYAL <pankaj.goyal@st.com>
In-Reply-To: <000501c5659a$9916bba0$0f10b40a@dlh.st.com>
References: <000501c5659a$9916bba0$0f10b40a@dlh.st.com>
Content-Type: text/plain
Date: Tue, 31 May 2005 09:16:32 +0200
Message-Id: <1117523793.14566.35.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd-bounces@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: Significance of Sector size while using the mkfs.jffs2 utility
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

please configure your mail client according to
http://www.infradead.org/~dwmw2/email.html Paragraph 8


On Tue, 2005-05-31 at 10:08 +0530, Pankaj GOYAL wrote:
>  I want to ask that is it safe to specify the sector size of 
>  4KB while my nand has the page size of 512 byte only.Also I
> 
>From the help text:
Use page size (max data node size) SIZE (default: 4KiB)

Thats the default page size and usually not necessary to change. It is
not related to the page size of the FLASH chip. It is the memory
PAGE_SIZE in the kernel which happens to be 4KiB.
 
>  want to know that what is the use of the option -p during 
>  the use of mkfs.jffs2 utility.Is is necessary to use this
>  option.What if I do not specify this flag.

Please read the following mail thread

http://lists.infradead.org/pipermail/linux-mtd/2005-March/012045.html


tglx
