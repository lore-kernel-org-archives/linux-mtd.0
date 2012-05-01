Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPGrF-0006xW-1G
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 17:27:25 +0000
Message-ID: <4FA01CF2.4030907@newsguy.com>
Date: Tue, 01 May 2012 10:27:14 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 7/7] mtd: driver _read() returns max_bitflips; mtd_read()
 returns -EUCLEAN
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-8-git-send-email-mikedunn@newsguy.com>
 <871unbis55.fsf@free.fr> <4F984CC9.9060701@newsguy.com>
 <1335727480.1942.18.camel@koala> <4F9EEE26.9040806@newsguy.com>
 <1335874805.2095.11.camel@koala>
In-Reply-To: <1335874805.2095.11.camel@koala>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Scott Wood <scottwood@freescale.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/01/2012 05:20 AM, Artem Bityutskiy wrote:
> On Mon, 2012-04-30 at 12:55 -0700, Mike Dunn wrote:
>>
>> Yeah, sorry Artem, I neglected to add the Acked-by's in the patches you just merged.
> 
> If you know that an Acked-by or Reviewed-by was missed, let me know and
> I'll add the tag(s) to the patch(es). I think it is important to be
> careful about the tags because people spent their time helping to
> improve the patches.


Well, I owe a debt to several reviewers, among them Brian Norris (caught the bug
that would cause all non-ecc devices to return -EUCLEAN), Shmulik Ladkani, Ivan
Djelic (reviews and tests), Scott Wood, Robert Jarzmik, yourself, ...

As far as formal tags... maybe these, if they don't object:

mtd: driver _read() returns max_bitflips; mtd_read() returns -EUCLEAN
5568eb3c3bb2816281b6a7c04db92434b72b1495
Tested-by: Ivan Djelic <ivan.djelic@parrot.com>

mtd: nand: read_page() returns max_bitflips
6bf87bf989bfdfc78fb2c5cd55de4bab9b572992
Acked-by (freescale changes): Scott Wood <scottwood@freescale.com>

If the others feel a tag credit is appropriate, I certainly don't mind.

Thanks,
Mike
