From: David Woodhouse <dwmw2@infradead.org>
To: "Karl(Kai) Ji" <k.ji@cn.metrologic.com>
In-Reply-To: <37B6F35E2FFAE447B874C31B40D30105020AC3@san.cn.mtlg.org>
References: <37B6F35E2FFAE447B874C31B40D30105020AC3@san.cn.mtlg.org>
Content-Type: text/plain
Message-Id: <1080549308.29835.345.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 29 Mar 2004 09:35:08 +0100
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 memLevel and windowBits
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-03-29 at 16:24 +0800, Karl(Kai) Ji wrote:
> memLevel=7 and windowBits=15 seems to be ok but memLevel=8 and windowBits=14
> unfortunately do not work. Why is that? From reading the comments in
> zlib.h/zconf.h seems such modification is allowed.  

I've no idea -- I treat zlib very much as a black box. I note that zlib
1.2 is released and claims to have significant performance improvements.

You might try using that in the kernel instead, although you'd need to
port the changes which have been made to zlib 1.1.3 since it was
included.

Alternatively, look at http://www.inf.u-szeged.hu/jffs2/

-- 
dwmw2
