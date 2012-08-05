Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sxw7r-0006G8-8B
 for linux-mtd@lists.infradead.org; Sun, 05 Aug 2012 08:23:52 +0000
Received: by bkcji2 with SMTP id ji2so814861bkc.36
 for <linux-mtd@lists.infradead.org>; Sun, 05 Aug 2012 01:23:48 -0700 (PDT)
Date: Sun, 5 Aug 2012 11:23:37 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBI fastmap updates
Message-ID: <20120805112337.2a315c75@pixies.home.jungo.com>
In-Reply-To: <20120802194538.26e2ec98@spider.haslach.nod.at>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1343916747.25013.112.camel@sauron.fi.intel.com>
 <20120802161512.5ac7a303@spider.haslach.nod.at>
 <1343917741.25013.114.camel@sauron.fi.intel.com>
 <20120802165132.1bf1e5d7@spider.haslach.nod.at>
 <1343924267.25013.156.camel@sauron.fi.intel.com>
 <20120802183210.7076aa48@spider.haslach.nod.at>
 <1343925930.25013.163.camel@sauron.fi.intel.com>
 <501AB2C8.9010805@am.sony.com>
 <1343929200.25013.197.camel@sauron.fi.intel.com>
 <20120802194538.26e2ec98@spider.haslach.nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "nyoushchenko@mvista.com" <nyoushchenko@mvista.com>,
 artem.bityutskiy@linux.intel.com,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Heinz.Egger@linutronix.de" <Heinz.Egger@linutronix.de>,
 "thomas.wucher@linutronix.de" <thomas.wucher@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tim Bird <tim.bird@am.sony.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "Marius.Mazarel@ugal.ro" <Marius.Mazarel@ugal.ro>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2 Aug 2012 19:45:38 +0200 Richard Weinberger <richard@nod.at> wrote:
> Okay, then let's explicitly reserve a few PEBs for fastmap.
> This should be very easy task.

Need to consider what's expected when migrating from a former non-FM
UBI system to an FM enabled system, in the case where all PEBs where
consumed (reserved) in the former system.

> How much PEB should be reserved? 2 x sizeof(fastmap)?

Since FM does not use EBA's atomic LEB change when writing the new
fastmap, but instead implements its own FM "leb change" internally -
then reserving 2x is needed if we'd like to avoid reusing the same
fastmap PEB.

Regards,
Shmulik
