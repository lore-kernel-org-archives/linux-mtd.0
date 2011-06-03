Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSPDm-0000h9-4j
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 07:55:08 +0000
Date: Fri, 3 Jun 2011 08:54:51 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 1/2] clps711x/ceiva: port to use physmap flash
Message-ID: <20110603075451.GF10532@n2100.arm.linux.org.uk>
References: <1307015648-17505-1-git-send-email-dbaryshkov@gmail.com>
	<1307075905.4405.130.camel@localhost>
	<BANLkTi=TQfMec9Kuq4-P9Rokp44g67Tx6A@mail.gmail.com>
	<1307077842.4405.133.camel@localhost>
	<BANLkTimG86aN5hUBy=GgpMAxhiQSPbetPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BANLkTimG86aN5hUBy=GgpMAxhiQSPbetPg@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 03, 2011 at 09:17:31AM +0400, Dmitry Eremin-Solenikov wrote:
> Anyway the patch removing mtd support can be pushed via mtd tree
> (there is really no point on mtd/maps/ceiva.c), and removing ceiva
> depends on Russell's decision.

If it's not getting any attention and no one's interested in it then
it can be removed.
