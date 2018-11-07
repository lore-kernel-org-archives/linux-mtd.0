Received: from twosheds.infradead.org ([2001:8b0:10b:1:21d:7dff:fe04:dbe2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKQRL-0008Ir-Ac
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 16:12:23 +0000
Message-ID: <8b08e8b992093453bb2b9caff8cff08c.squirrel@twosheds.infradead.org>
In-Reply-To: <1e4c066d1896e2a0b8b146253d34d05cc4f9ab36.camel@infinera.com>
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
 <1e4c066d1896e2a0b8b146253d34d05cc4f9ab36.camel@infinera.com>
Date: Wed, 7 Nov 2018 16:12:14 -0000
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Joakim Tjernlund" <Joakim.Tjernlund@infinera.com>
Cc: "nkela@cisco.com" <nkela@cisco.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Yes, this may slow things down. I am not sure I agree with the impl.
> either.
> Could one not make cpu_to_je_X/jeX_to_cpu a function ptr which is set to
> a func. with the correct endian?

On x86 retpoline would make that quite slow.

-- 
dwmw2
