Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW5xI-000860-Kd
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 12:41:37 +0000
Message-ID: <4ED775E8.7020702@newsguy.com>
Date: Thu, 01 Dec 2011 04:41:12 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/5] mtd api changed to return bitflips on read operations
References: <1322528477-19666-1-git-send-email-mikedunn@newsguy.com>
 <20111129144042.1979a587@skate> <1322730506.2332.30.camel@koala>
 <4ED7636E.7010307@newsguy.com>
 <1322739492.24797.438.camel@sauron.fi.intel.com>
In-Reply-To: <1322739492.24797.438.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Vimal Singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/01/2011 03:38 AM, Artem Bityutskiy wrote:
> On Thu, 2011-12-01 at 03:22 -0800, Mike Dunn wrote:
>> Should the patchset be combined into one patch?  Are separate, interdependent
>> patches ill-advised?
> I guess it is OK.
>


OK, one patch it is.  I'll wait for Robert's fixed patch to get pushed to
l2-mtd-2.6.git and rebase with that before putting it together.

Thanks!
Mike
