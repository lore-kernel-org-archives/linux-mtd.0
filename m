Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REdm7-0001Nv-DN
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 09:09:55 +0000
Received: by wwf10 with SMTP id 10so1360427wwf.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 02:09:53 -0700 (PDT)
Subject: Re: cfi_cmdset_0002.c SST39VF3201B issue
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
Date: Fri, 14 Oct 2011 12:09:21 +0300
In-Reply-To: <1318067449.1586.2.camel@AURIO02>
References: <4E8D9F14.4090108@gmail.com> <1317905313.4526.9.camel@AURIO02>
	<4E8DB0A1.5080202@gmail.com> <1318067449.1586.2.camel@AURIO02>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318583368.12351.77.camel@sauron>
Mime-Version: 1.0
Cc: angelo <angelo70@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-10-08 at 11:50 +0200, Fabio Giovagnini wrote:
> Hi Angelo,
> I have worked with 2.6.38 and I have used 0x50 command and modification
> into mkfs.jffs2 utility in order to accomplish a 4k fs sector size.
> It is working and I think that in a not so huge memory support a 4k
> sector allows a better management rather than 64k sector.

4KiB is too small for JFFS2. If it works for you, it is only because you
are lucky or you did not stress it well enough. Also, small eraseblocks
just make JFFS2 much slower than it could be.

-- 
Best Regards,
Artem Bityutskiy
