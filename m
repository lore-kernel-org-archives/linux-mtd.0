Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFRV6-0004O8-2W
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 16:24:45 +0000
Received: by mail-pb0-f49.google.com with SMTP id xb4so2061431pbc.36
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2013 09:24:22 -0700 (PDT)
Message-ID: <5220C733.7090401@gmail.com>
Date: Fri, 30 Aug 2013 09:24:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH -next v2 02/10] mtd: tests: rename sources in order to
 link a helper object
References: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
 <1375523536-32671-3-git-send-email-akinobu.mita@gmail.com>
 <1377878039.22372.55.camel@shinybook.infradead.org>
In-Reply-To: <1377878039.22372.55.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Vikram Narayanan <vikram186@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Akinobu Mita <akinobu.mita@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/30/2013 08:53 AM, David Woodhouse wrote:
> On Sat, 2013-08-03 at 18:52 +0900, Akinobu Mita wrote:
>> Each mtd test module have a single source whose name is the same as
>> the module name.  In order to link a single object including helper
>> functions to every test module, this rename these sources to the
>> different names.
>
> Hrm, why link a separate copy into every test module? Why not just make
> a separate mtd_test.ko module and have it export the symbols?
>
> Not that I really mind simplifying the names of the actual C files
> anyway, I suppose. So I'm applying the sequence as-is, but perhaps we
> could follow up by making it a separate module?

We actually had the discussion (in multiple threads?) that because a 
separate module would complicate the process for running the test 
modules, it is preferable to copy the small helper code into each 
module. That is, we don't want to do this:

insmod mtd_test.ko
insmod mtd_<actualtest>.ko dev=X ...

However, this is still fairly trivial, so if you think there are good 
reasons to provide separate modules, I do not object to separate modules.

Brian
