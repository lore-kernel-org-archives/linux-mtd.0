Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkZFf-0005E8-UI
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 11:20:40 +0000
Date: Fri, 29 Jun 2012 13:20:35 +0200
From: Richard Weinberger <richard@nod.at>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH] ubi: fastmap: Do not free 'ai' in 'scan_all()'
Message-ID: <20120629132035.1428ca01@spider.haslach.nod.at>
In-Reply-To: <20120628174546.491954e2@pixies.home.jungo.com>
References: <20120628165239.52cffc64@pixies.home.jungo.com>
 <20120628174546.491954e2@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: nyoushchenko@mvista.com,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Thu, 28 Jun 2012 17:45:46 +0300
schrieb Shmulik Ladkani <shmulik.ladkani@gmail.com>:

> From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> 
> Do not call 'destroy_ai(ai)' at error handling of 'scan_all', since:
> - 'ai' is allocated in 'ubi_attach' (the caller of scan_all) and
>   provided as an argument. It's not scan_all's responsibility to free
> it
> - It is not consistent with scan_all's sister function
>   'ubi_attach_fastmap()' which does not free the given 'ai'
> - It will cause a double free as 'ubi_attach' (the caller of scan_all)
>   already destroys 'ai' in case of an error
> 
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> ---

Applied!

Thanks,
//richard
