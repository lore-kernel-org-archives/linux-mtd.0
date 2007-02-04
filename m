Received: from web51908.mail.yahoo.com ([206.190.48.71])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HDhNw-0003oC-KD
	for linux-mtd@lists.infradead.org; Sun, 04 Feb 2007 08:26:28 -0500
Date: Sun, 4 Feb 2007 05:26:21 -0800 (PST)
From: Doug Kehn <rdkehn@yahoo.com>
Subject: Re: jffs2, program can't run
To: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <200702041532333435388@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <116087.21586.qm@web51908.mail.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

--- "xun.global" <xun.global@gmail.com> wrote:

>     I use jffs2 on my at91rm9200 board with
> dataflash, but i find sometimes the program (auto
> run after mount the filesystem) dies when it open a
> file on dataflash, even if i reboot the system. But
> when the program dies, it can run by hand start it. 
>     Could someone can help me. Thank you.
> 

How does the program die?  Segment Fault or failure to
load a library needed by the program?

What kernel version are you using?

Are your observations similar to those reported in:

http://lists.infradead.org/pipermail/linux-mtd/2007-January/017252.html

Regards,
...doug



 
____________________________________________________________________________________
TV dinner still cooling? 
Check out "Tonight's Picks" on Yahoo! TV.
http://tv.yahoo.com/
