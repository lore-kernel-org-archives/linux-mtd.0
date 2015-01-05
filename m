Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8EYj-0002b7-Lt
 for linux-mtd@lists.infradead.org; Mon, 05 Jan 2015 20:47:30 +0000
Received: by mail-pa0-f47.google.com with SMTP id kq14so29287187pab.6
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jan 2015 12:47:08 -0800 (PST)
Date: Mon, 5 Jan 2015 12:47:04 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH 4/6] mtd: Introduce SPI NAND framework
Message-ID: <20150105204704.GF9759@ld-irv-0074>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-5-git-send-email-ezequiel.garcia@imgtec.com>
 <87F60714EC601C4C83DFF1D2E3D390A049EE77@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7713CD34@NTXXIAMBX02.xacn.micron.com>
 <54983C57.6070403@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54983C57.6070403@imgtec.com>
Cc: =?utf-8?B?IlFpIFdhbmcg546L6LW3IChxaXdhbmcpIg==?= <qiwang@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 James Hartley <james.hartley@imgtec.com>,
 "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>,
 =?utf-8?B?IlBldGVyIFBhbiDmvZjmoIsgKHBldGVycGFuZG9uZyki?=
 <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 22, 2014 at 12:44:23PM -0300, Ezequiel Garcia wrote:
> On 12/22/2014 01:34 AM, Qi Wang 王起 (qiwang) wrote:
> >> +/*
> >> + * Wait until the status register busy bit is cleared.
> >> + * Returns a negatie errno on error or time out, and a non-negative
> >> +status
> >> + * value if the device is ready.
> >> + */
> >> +static int spi_nand_wait_till_ready(struct spi_nand *snand) {
> >> +	unsigned long deadline = jiffies + msecs_to_jiffies(100);
> > 
> > 100ms will be applied to all operation, but I think it would be more
> > make sense to use different timeout value for different operation, 
> > just like Parallel NAND as below:
> > "
> 
> Yes, indeed. You are right. Now we need to find out the appropriate
> value in each case. Any suggestions?

Isn't the value of 'deadline' only important for the uncommon case of a
misbehaving flash? If so, I don't think it's too important to tune it to
be as small as possible.

> > static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
> > {
> > 
> > 	int status, state = chip->state;
> > 	unsigned long timeo = (state == FL_ERASING ? 400 : 20);
> > "	

Brian
