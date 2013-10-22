Received: from mail-qc0-x235.google.com ([2607:f8b0:400d:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYk7t-0006eS-96
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 22:08:33 +0000
Received: by mail-qc0-f181.google.com with SMTP id w4so5145334qcr.26
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 15:08:12 -0700 (PDT)
Date: Tue, 22 Oct 2013 15:08:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [RESEND][PATCH] mtd: bcm47xxpart: detect "factory" partition
Message-ID: <20131022220807.GQ23337@ld-irv-0074.broadcom.com>
References: <1382387734-22049-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1382387734-22049-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 21, 2013 at 10:35:34PM +0200, Rafał Miłecki wrote:
> A new type of partition with magic FCTY was found on Huawei E970:
> 46 43 54 59 4b 51 37 4e  41 42 31 38 41 32 39 30  |FCTYKQ7NAB18A290|
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed to l2-mtd.git. Thanks!

Brian
