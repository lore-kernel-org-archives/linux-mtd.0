Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz4BH-0006he-FZ
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 09:35:16 +0000
Subject: Re: [PATCH 02/02] force module loaded with partitions set
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Yang Rui Rui <ruirui.r.yang@tieto.com>
In-Reply-To: <4D7DDC19.6080404@tieto.com>
References: <20110314015148.GA6827@darkstar>
	<1300092195.2727.4.camel@localhost> <4D7DD878.5090903@tieto.com>
	<1300092812.2727.9.camel@localhost>  <4D7DDC19.6080404@tieto.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Mar 2011 11:33:19 +0200
Message-ID: <1300095199.2727.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Yang Ruirui R <ruirui.r.yang@tietoenator.com>,
	"ext-phil.2.carmody@nokia.com" <ext-phil.2.carmody@nokia.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"ext-jani.1.nikula@nokia.com" <ext-jani.1.nikula@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-03-14 at 17:12 +0800, Yang Rui Rui wrote:
> > I think you should rather re-work the framework a bit and make the
> > "->add_mtd()" call-back return an integer error code. Then we could just
> > return errors on error and prevent the module from being loaded.
> >
> 
> I'm thinking is it possible to pass partitions param later? ie. use sysfs attribute?

It may be possible, but would probably require some work.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
