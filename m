Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVHJg-0005aK-Du
 for linux-mtd@lists.infradead.org; Wed, 02 Apr 2014 09:18:41 +0000
Received: by mail-la0-f43.google.com with SMTP id e16so8087303lan.30
 for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2014 02:18:17 -0700 (PDT)
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Andrea Adami <andrea.adami@gmail.com>
In-Reply-To: <CAAQYJAvRWt7fEyFbYf9UrK4f5TZDu48dyiVwSfm=MXZnzk5E8A@mail.gmail.com>
References: <1396287151.4857.50.camel@mars>
 <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
 <1396303460.4857.111.camel@mars>
 <OFA7BCC382.7C5EA8B7-ONC1257CAD.002CA0C1-C1257CAD.002EAA92@LocalDomain>
 <OFCD64B0EF.BC0E327D-ONC1257CAD.003CE517-C1257CAD.003DCE3D@transmode.se>
 <1396364991.4850.37.camel@mars>
 <OFDA5ED549.208718B9-ONC1257CAD.0068922B-C1257CAD.006990F4@transmode.se>
 <1396393830.6474.31.camel@mars>
 <OF12157674.86C034EE-ONC1257CAE.00287492-C1257CAE.0028C422@transmode.se>
 <CAAQYJAvRWt7fEyFbYf9UrK4f5TZDu48dyiVwSfm=MXZnzk5E8A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 02 Apr 2014 11:18:13 +0200
Message-ID: <1396430293.5197.14.camel@mars>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Marius Achilles <M.Achilles@phytec.de>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-04-02 at 10:06 +0200, Andrea Adami wrote:
> Have you tried disabling only "Suspend erase on write" ?
> 
> cfip->SuspendCmdSupport &= ~1;
> 
> That did the trick for other stubborn flash chips.

I'll recheck to be sure.

 Thanks
  -- Christoph
