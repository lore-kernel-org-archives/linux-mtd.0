Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fy777-00005T-OZ
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 09:09:07 -0400
Subject: Re: [PATCH 1/1] UBI
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0607050543p4ab85316vc4d62f30e1ecb571@mail.gmail.com>
References: <1151408975.16490.12.camel@sauron.oktetlabs.ru>
	<625fc13d0607050436r591a1857m348c8f64cc16e0b1@mail.gmail.com>
	<1152100017.4825.20.camel@sauron.oktetlabs.ru>
	<625fc13d0607050543p4ab85316vc4d62f30e1ecb571@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 05 Jul 2006 17:07:47 +0400
Message-Id: <1152104867.4825.22.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-07-05 at 07:43 -0500, Josh Boyer wrote:
> > On Wed, 2006-07-05 at 06:36 -0500, Josh Boyer wrote:
> > > Does the range for bad eraseblock reserve really need to be up to 1/2
> > > the device?
OK, a patch which makes it 25 is added.

Thanks.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
