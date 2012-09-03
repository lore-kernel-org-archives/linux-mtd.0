Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8Pn6-0001av-AH
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 06:05:45 +0000
Received: by pbbrq8 with SMTP id rq8so8011430pbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 02 Sep 2012 23:05:40 -0700 (PDT)
Message-ID: <504448B1.4050205@gmail.com>
Date: Sun, 02 Sep 2012 23:05:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: FW: UBIFS tools and latest 2.6.33 kernel from
 http://git.infradead.org/users/dedekind/ubifs-v2.6.33.git
References: <886EEBE3AFFFB144AA8169C199AB4E6AA7BC4D5FB8@BBMBX.backbone.local>
 <1346416026.9709.47.camel@sauron.fi.intel.com>
 <CAN8TOE8j9gxpXAmL51gqaW8=TFLQLPhp03inryx_-uZv4901Ng@mail.gmail.com>
 <1346583467.2533.1.camel@kyv>
In-Reply-To: <1346583467.2533.1.camel@kyv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Clark <dclark@tantalus.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/02/2012 03:57 AM, Artem Bityutskiy wrote:
> On Fri, 2012-08-31 at 15:18 -0700, Brian Norris wrote:
>> There was a series of 'writebufsize' fixes that may be missing from
>> multiple backport trees. I can help you track them down, if you'd like
>> the help.
>
> Sure, go ahead, I can them put them to the backport trees.

OK, I just put up my own github backport tree, with branches for v2.6.32 
through v3.3. I think your v3.4+ repos are fine. URL:

   git://github.com/computersforpeace/UBIFS-backports.git
   https://github.com/computersforpeace/UBIFS-backports.git

Branches:

   ubifs-v2.6.32
   ubifs-v2.6.33
   ubifs-v2.6.34
   ubifs-v2.6.35
   ubifs-v2.6.36
   ubifs-v2.6.37
   ubifs-v2.6.38
   ubifs-v2.6.39
   ubifs-v3.0
   ubifs-v3.1
   ubifs-v3.2
   ubifs-v3.3

Each branch should have some version (amended when necessary) of the 
following commits. Note that docg3 wasn't merged until v3.2. Also, 
spear_smi wasn't merged until v3.4 and was already fixed in the 
appropriate backports, so it is omitted from this list.

Brian

---

[ In 'git log' order ]

commit c4cc625ea5958d065c21cc0fcea29e9ed8f3d2bc
Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Fri Feb 3 10:16:50 2012 +0200

     mtd: sst25l: initialize writebufsize

commit fcc44a07dae0af16e84e93425fc8afe642ddc603
Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Fri Feb 3 09:53:28 2012 +0200

     mtd: lart: initialize writebufsize

commit 82c4c58d6f1a78e8de875272a19ab9220b8066aa
Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Fri Feb 3 09:44:32 2012 +0200

     mtd: docg3: initialize writebufsize

commit 71f60fbebf0f18dd4e855335a009efda251b1697
Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Fri Feb 3 09:43:14 2012 +0200

     mtd: doc2001plus: initialize writebufsize

commit cca84b569ebe3372b28949e00b0a3a17f87e2970
Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Fri Feb 3 09:42:39 2012 +0200

     mtd: doc2001: initialize writebufsize

commit cd1986a3c111f7ed597619705290fa52a975014f
Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Fri Feb 3 09:38:43 2012 +0200

     mtd: doc2000: initialize writebufsize

commit b604387411ec6a072e95910099262616edd2bd2f
Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Fri Feb 3 09:32:44 2012 +0200

     mtd: block2mtd: initialize writebufsize

commit b54f47c8bcfc5f766bf13ec31bd7dd1d4726d33b
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Tue Jan 31 00:06:03 2012 -0800

     mtd: m25p80: set writebufsize
