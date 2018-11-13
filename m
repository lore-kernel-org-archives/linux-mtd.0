Received: from alln-iport-5.cisco.com ([173.37.142.92])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMME5-0004JK-PZ
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2018 00:06:44 +0000
Date: Mon, 12 Nov 2018 16:06:27 -0800
From: Daniel Walker <danielwa@cisco.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Nikunj Kela (nkela)" <nkela@cisco.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
Message-ID: <20181113000627.oe7cshgzfk4lf3to@zorba>
References: <591D4732-BC3E-4F85-9277-25E049FFF4BA@cisco.com>
 <CAFLxGvz8QgK1P6d-_biSRk4fyYEobio315_tUP+cRXTvt+m1hA@mail.gmail.com>
 <01b82f6eb37b674effc6c8b0fa4a014deb401a85.camel@infradead.org>
 <B1D7CC34-C9D3-4745-94A1-3F713C1CB216@cisco.com>
 <897867ec09af82ca76c642b48ad23a7f08838dcf.camel@infradead.org>
 <20181112214333.lplffcc722hta43v@zorba>
 <20181112225015.jyuro3z3ygavnvrp@zorba>
 <f64aa222a15467dc667deb5fc1bbcae1e477482a.camel@infradead.org>
 <20181112234022.r3gyu633ln3bp774@zorba>
 <b797e897960c3c047dfc7874615358a5443038a8.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b797e897960c3c047dfc7874615358a5443038a8.camel@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 12, 2018 at 03:43:37PM -0800, David Woodhouse wrote:
> 
> That can't hurt. We should probably look at the time elapsed before you
> can *write* to it (when the background scan and crc checking is
> complete) rather than just reading.
> 


I'm not sure how to test that, but I tried this,

mount -t jffs2 mtd7 /mnt ; perf stat -B dd if=/dev/zero of=/mnt/test bs
1 count=1;

What would you suggest for testing this ?

Daniel
