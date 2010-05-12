Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OC8lh-00079c-OM
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 10:02:23 +0000
Subject: Re: UBIL design doc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <AANLkTikRDNia3IMCbXFs-olREPftszw-zqn3ruXCk-QE@mail.gmail.com>
References: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
	<1273475736.2209.88.camel@localhost>
	<alpine.LFD.2.00.1005102011400.3401@localhost.localdomain>
	<1273650099.22706.41.camel@localhost>
	<AANLkTilSqtxewM9WNSu814FT9qsctuuxNiK4pboX2xjr@mail.gmail.com>
	<1273653341.22706.46.camel@localhost>
	<AANLkTikRDNia3IMCbXFs-olREPftszw-zqn3ruXCk-QE@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 May 2010 13:01:21 +0300
Message-ID: <1273658481.22706.73.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	rohitvdongre@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-12 at 15:19 +0530, Brijesh Singh wrote:
> >> Any thing goes bad, normal scanning becomes recovery.
> >> 5) Not sure if log is required in first place. But it could be an option.
> >> Is that correct?
> >
> > No, at least I did not suggest you to get rid of the log. It is needed
> > to handle unclean reboots.
> Log is written for each EC or VID change.

Yes, I understand.

>  Frequency of log write is same as
> the frequency of these headers.

Right.

>  In case we keep both, there will be one log
> write penalty per write/erase.

Yes, each time you write to an unmapped LEB, you write the VID header
and a log entry.

>  So write performance will drop considerably.

Not sure about 'considerably'. This is to be tested. Keeping the headers
means 1 additional write per peb_size bytes, right? Plus just after
erase, EC header should be written. But this is the price you pay for
robustness and compatibility.

But again, it is very easy to switch off headers if this is needed,
isn't it?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
