Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8ZKo-0007hR-75
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 16:17:10 +0000
Received: by bkcji2 with SMTP id ji2so2404261bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 09:17:06 -0700 (PDT)
Message-ID: <5044D7F9.2070906@gmail.com>
Date: Mon, 03 Sep 2012 18:16:57 +0200
From: simon widmer <simonxwidmer@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBIFS Informations
References: <503F7685.8030707@gmail.com>
 <1346673385.3061.48.camel@sauron.fi.intel.com>
In-Reply-To: <1346673385.3061.48.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/03/2012 01:56 PM, Artem Bityutskiy wrote:
> You are the second person complaining about this. What is the kernel 
> version your image worked fine with? 
I am working on custom target kernel (running on an arm based embedded 
system) which did not change version (i only changed compile options) 
->  2.6.31
The kernel on which I build the ubifs did in fact change -> from ubuntu 
8.4 (2.6.24) to ubuntu 10.04 (2.6.33)
I have to check if I still have the virtual machine image of the old 
building system that i could countercheck if I can reproduce a working 
image. I will do that tomorrow.
