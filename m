Received: from va-65-40-217-47.sta.embarqhsd.net ([65.40.217.47]
	helo=CVAEX1.VERTICAL.COM)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IaCnS-0002Is-R1
	for linux-mtd@lists.infradead.org; Tue, 25 Sep 2007 11:58:05 -0400
Content-class: urn:content-classes:message
Subject: RE: Clobbered file after jffs2 mount
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Sep 2007 11:57:58 -0400
Message-ID: <4DD3AF7ECBBC43409BA36508938D01851B0092@CVAEX1.VERTICAL.COM>
In-Reply-To: <1190425861.7150.212.camel@pmac.infradead.org>
From: "Jon Ringle" <JRingle@vertical.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Brian T" <btuch@usa.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, September 21, 2007 21:51, David Woodhouse wrote:
> It's going to be something scribbling on the RAM pages after the file
is
> read from the file system. Be thankful it looks fairly repeatable. Can
> you put a hardware watchpoint on the offending page in the page cache,
> after it's read? And can you disable _everything_ in the system which
> uses DMA, one at a time?

I was able to disable everything else that had external hardware access
to flash and the IXP's memory and the problem still appeared. I have now
been able to determine that the fault lies with some memory scribbling
done by one of our own kernel modules.

There is no need to further bother this mailing list with this issue.

Thanks David and Brian for your input in this problem :)

Jon
