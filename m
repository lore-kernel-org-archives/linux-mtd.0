MIME-Version: 1.0
In-Reply-To: <20110603075451.GF10532@n2100.arm.linux.org.uk>
References: <1307015648-17505-1-git-send-email-dbaryshkov@gmail.com>
	<1307075905.4405.130.camel@localhost>
	<BANLkTi=TQfMec9Kuq4-P9Rokp44g67Tx6A@mail.gmail.com>
	<1307077842.4405.133.camel@localhost>
	<BANLkTimG86aN5hUBy=GgpMAxhiQSPbetPg@mail.gmail.com>
	<20110603075451.GF10532@n2100.arm.linux.org.uk>
Date: Fri, 3 Jun 2011 13:21:07 +0400
Message-ID: <BANLkTinfbi+fMq5nbWfYyUSVTXx-263jQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clps711x/ceiva: port to use physmap flash
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
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

On 6/3/11, Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> On Fri, Jun 03, 2011 at 09:17:31AM +0400, Dmitry Eremin-Solenikov wrote:
>> Anyway the patch removing mtd support can be pushed via mtd tree
>> (there is really no point on mtd/maps/ceiva.c), and removing ceiva
>> depends on Russell's decision.
>
> If it's not getting any attention and no one's interested in it then
> it can be removed.

I've sent a separate e-mail to ARM ML to see if anybody is interested.


-- 
With best wishes
Dmitry
