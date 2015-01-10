Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9qUM-00088s-Fu
 for linux-mtd@lists.infradead.org; Sat, 10 Jan 2015 07:29:39 +0000
Received: by mail-pd0-f178.google.com with SMTP id r10so21428920pdi.9
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2015 23:29:16 -0800 (PST)
Date: Fri, 9 Jan 2015 23:29:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 1/2] mtd: physmap_of: Add read-only fallback
Message-ID: <20150110072913.GB5999@norris-Latitude-E6410>
References: <103889901.65008.1411665422229.JavaMail.zimbra@xes-inc.com>
 <2002674283.65675.1411665608272.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2002674283.65675.1411665608272.JavaMail.zimbra@xes-inc.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 25, 2014 at 12:20:08PM -0500, Aaron Sierra wrote:
> From: Joe Schultz <jschultz@xes-inc.com>
> 
> Previously, when probing a CFI chip which was write-protected at the
> hardware level, the probe would fail due to the fact it could not put
> the chip into QUERY mode. This would result in no MTD devices being
> created.
> 
> Add a fallback to probe using the map_rom driver if the user-selected
> probe fails.
> 
> Signed-off-by: Joe Schultz <jschultz@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Pushed to l2-mtd.git. Thanks!

Brian
