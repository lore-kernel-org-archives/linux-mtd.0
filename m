Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qa4qO-00047q-Oc
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 11:46:42 +0000
Received: by wyf23 with SMTP id 23so2355345wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 04:46:35 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [Ubi] Wrong major:minor
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
	<1306917381.4405.76.camel@localhost>
	<1306917455.4405.77.camel@localhost>
	<BANLkTikha6F8GbWDNpwB4Q-v1V36ARcVVA@mail.gmail.com>
Date: Fri, 24 Jun 2011 13:46:29 +0200
In-Reply-To: <BANLkTikha6F8GbWDNpwB4Q-v1V36ARcVVA@mail.gmail.com> (Mike
	Frysinger's message of "Wed, 1 Jun 2011 06:11:49 -0400")
Message-ID: <87mxh78nai.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Gilles <gilles.ganault@free.fr>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Mike" == Mike Frysinger <vapier.adi@gmail.com> writes:

Hi,

 >> Although I'm not sure - dynamic numbers were introduced because
 >> fixed numbers are PITA, so adding such a parameter would be a step
 >> backward.  Not sure...

 Mike> yeah, i dont think there should be.  at least nothing specific to
 Mike> ubi.  perhaps a general kernel thing where you could match the
 Mike> registered name to a static #, but then that wouldnt be ubi's
 Mike> problem.  that'd be in the core logic and work for all devices.

That already exists - CONFIG_DEVTMPFS.

-- 
Bye, Peter Korsgaard
