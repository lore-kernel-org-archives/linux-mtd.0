Received: from zproxy.gmail.com ([64.233.162.202])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeGwJ-0008V6-7c
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 14:02:59 -0500
Received: by zproxy.gmail.com with SMTP id i11so834440nzi
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Nov 2005 11:02:54 -0800 (PST)
Message-ID: <625fc13d0511211102o7c8ba59aobdd55d0b6f1e3dae@mail.gmail.com>
Date: Mon, 21 Nov 2005 13:02:54 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Peter Menzebach <pm-mtd@mw-itcon.de>
In-Reply-To: <4381FB55.5080001@mw-itcon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <4381FB55.5080001@mw-itcon.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to decrease the delay to flush write buffer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/21/05, Peter Menzebach <pm-mtd@mw-itcon.de> wrote:
> Hi,
> I am using jffs2 on Atmel dataflash. I encounter sometimes errors like
> "Empty flash at 0x004a7814 ends at 0x004a79c0" and "read_dnode: header
> CRC failed on node at 0x63d670: read 0xffffffff, calculated 0x8f83d3bc".
> My guess at the moment is, that this happens at unclean reboots (power
> off), where the write buffer is not flushed. For dataflash
> CONFIG_JFFS2_FS_WRITEBUFFER is mandatory.
>
> For my purpose this would be avoided more or less completely, if the
> write buffer would be flushed after a delay of some 100 ms instead of
> some seconds. How can I reduce this timer?

http://linux-mtd.infradead.org/faq/jffs2.html

Read "How is ensured, that data is written to flash ?"

josh
