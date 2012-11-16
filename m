Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZHnb-0005LN-VQ
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 09:01:21 +0000
Message-ID: <50A600D9.5040804@parrot.com>
Date: Fri, 16 Nov 2012 10:01:13 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: ubifs  can not be mounted rw : could not find an empty LEB
References: <5098D625.7050103@parrot.com>
 <1352989463.2221.59.camel@sauron.fi.intel.com>
In-Reply-To: <1352989463.2221.59.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <dedekind@infradead.org>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Tue, 2012-11-06 at 10:19 +0100, Matthieu CASTET wrote:
>> Hi,
>>
>> on some of our product, when we try to mount a partition rw, we got the error :
>> could not find an empty LEB and mount return "No space left on device".
> 
> The symptoms are the same as the symptoms of the problem I recently
> fixed. Please, see the following 2 patches in linux-ubifs.git:
> 
> UBIFS: introduce categorized lprops counter
> UBIFS: fix mounting problems after power cuts
> 
> I'll send them to Linus for 3.7 shortly.
> 
Thanks, it solved the issue.
