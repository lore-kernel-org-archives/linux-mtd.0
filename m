Received: from lvk-gate.cmc.msu.ru ([188.44.42.233] helo=mail.lvk.cs.msu.su)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjm3R-0000Mx-Q8
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 06:48:47 +0000
From: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>
To: Namjae Jeon <linkinjeon@gmail.com>
Subject: Re: UBI fastmap updates
Date: Wed, 27 Jun 2012 10:48:26 +0400
References: <1340456602-46050-1-git-send-email-richard@nod.at>
 <CAKYAXd-3ArdssdotKHjvUU0f+yqcFC6y2rHF-mqnJnUcP=+eOg@mail.gmail.com>
In-Reply-To: <CAKYAXd-3ArdssdotKHjvUU0f+yqcFC6y2rHF-mqnJnUcP=+eOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201206271048.31524@zigzag.lvk.cs.msu.su>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, artem.bityutskiy@linux.intel.com,
 tglx@linutronix.de, Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi. Richard.
>
> Would you infom me how much UBI attach time is improved with fastmap ?

I'm not Richard but still.

On board I'm currently working on, ubi attach time for 1G chip without 
fastmap is more than 5 seconds. With fastmap, it is less than 250 
milliseconds.

Nikita
