Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXeh4-0003XN-54
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 23:45:10 +0000
Received: by pdbcz9 with SMTP id cz9so71971318pdb.3
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 16:44:49 -0700 (PDT)
Date: Mon, 16 Mar 2015 16:44:42 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Anatol Pomazau <anatol@google.com>
Subject: Re: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
Message-ID: <20150316234442.GM32500@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <CALj_zD5rW3Se27Rh0pL6QTMNGOrrmrvAVLvW3BCuF8RujYQE=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALj_zD5rW3Se27Rh0pL6QTMNGOrrmrvAVLvW3BCuF8RujYQE=g@mail.gmail.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Your HTML mail will likely get blocked by a lot of filters)

Hi Anatol,

On Mon, Mar 16, 2015 at 04:24:20PM -0700, Anatol Pomazau wrote:
> Hi Brian
> 
> Thanks for the patch series. I am going to test it on a Broadcom dev board.
> 
> Do you plan to add a patch for bcm-cygnus.dtsi similar to what is done
> here https://github.com/Broadcom/cygnus-linux/commit/
> 1de02697829c3a2ce48a1bc29a8535e4961999ca
> 
> ?

Not yet. As I note below, this does not work as-is on Cygnus. I wanted
to get the initial code out there, as this already supports some chips.
There as still some additions necessary to get iProc/Cygnus and BCM53xxx
chips working (WIP).

The code you link to is a hacked version from Ray. His changes have not
been integrated yet.

> On Fri, Mar 6, 2015 at 5:18 PM, Brian Norris <computersforpeace@gmail.com>
> wrote:
>      Hi,
> 
>      This adds (long in coming) support for the Broadcom BCM7xxx Set-Top
>      Box NAND
>      controller. This controller has been used in a variety of Broadcom
>      SoCs.
> 
>      There are a few more features I'd like add in the near future, mostly
>      to
>      support more SoCs, but this is the base set, which should only need
>      relatively
>      minor additions to support chips like BCM63138, BCM3384, and Cygnus/
>      iProc.
>      Particularly, we may need to straighten out some endianness issues
>      for the data
>      path on iProc, and interrupt enabling/acking on iProc, BCM63xxx,
>      BCM3xxx, and
>      others.

^^^ Note the previous 2 sentences.


>      TODO: add this to the DTS(I) files for BCM7445.
> 
>      Happy reviewing! (Speaking of which, I need to catch up on reviewing
>      everybody
>      else's MTD submissions...)
> 
>      Brian

Brian
