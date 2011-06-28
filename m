Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbaGS-0003CF-BE
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 15:31:48 +0000
Message-ID: <4E09F3F1.7080109@free-electrons.com>
Date: Tue, 28 Jun 2011 17:32:01 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH] UBI: new module ubiblk: block layer on top of UBI
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>	<1308922482-14967-2-git-send-email-david.wagner@free-electrons.com>	<1309202771.24805.11.camel@koala>
	<4E09EA52.8090006@parrot.com>
In-Reply-To: <4E09EA52.8090006@parrot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/28/2011 04:50 PM, Matthieu CASTET wrote:
> Hi,
>
[...]
> Also what are the advantage against gluebi + mtdblock_ro ?

The main advantage is a reduced number of layers ; I must say I cannot
see much more for now.  I could add that the Kconfig help of gluebi
advises not to use it except when needed by legacy software.

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
