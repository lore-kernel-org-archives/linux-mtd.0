Received: from kiutl.biot.com ([31.172.244.210])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqjHs-00021T-J9
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 14:30:01 +0000
Received: from spamd by kiutl.biot.com with sa-checked (Exim 4.83)
 (envelope-from <bert@biot.com>) id 1YqjHR-000170-Re
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 16:29:34 +0200
Message-ID: <554CC847.6020004@biot.com>
Date: Fri, 08 May 2015 16:29:27 +0200
From: Bert Vermeulen <bert@biot.com>
MIME-Version: 1.0
To: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH v2] nand: Add NAND driver for Mikrotik RB4xx series boards
References: <1431001910-4004-1-git-send-email-bert@biot.com>
 <CAH6sp9OcFXcX6vgkPPJqCE-X1_fKPOBo0Ak2g=pWiWPZuCt5Yg@mail.gmail.com>
In-Reply-To: <CAH6sp9OcFXcX6vgkPPJqCE-X1_fKPOBo0Ak2g=pWiWPZuCt5Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/08/2015 12:14 PM, Frans Klaver wrote:
> On Thu, May 7, 2015 at 2:31 PM, Bert Vermeulen <bert@biot.com> wrote:
>> +
>> +       info->chip.priv = info;
>> +       info->mtd.priv  = &info->chip;
>> +       info->mtd.owner = THIS_MODULE;
> 
> If you should respin, could you add
> 
> info->mtd.dev.parent = &pdev->dev;
> 
> This will have a symlink to the parent device show up in sysfs. Seems
> some people feel rather strongly about that.

Sure, will do. I'll wait for some comment from David Woodhouse or Brian
Norris first, in case there's something more substantial to fix as well.


-- 
Bert Vermeulen        bert@biot.com          email/xmpp
