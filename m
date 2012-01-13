Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rljp7-00038b-E3
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 16:17:51 +0000
Received: by bkty8 with SMTP id y8so3752852bkt.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 08:17:47 -0800 (PST)
Message-ID: <4F1066F8.4000602@mvista.com>
Date: Fri, 13 Jan 2012 20:16:40 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH 3/7] bitops: introduce list_for_each_clear_bit
References: <1326470004-10096-1-git-send-email-akinobu.mita@gmail.com>
 <1326470004-10096-4-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1326470004-10096-4-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-s390@vger.kernel.org, linux-usb@vger.kernel.org,
 Robert Richter <robert.richter@amd.com>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-mtd@lists.infradead.org,
 "H. Peter Anvin" <hpa@zytor.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 linux390@de.ibm.com, akpm@linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 01/13/2012 06:53 PM, Akinobu Mita wrote:

> Introduce list_for_each_clear_bit() and list_for_each_clear_bit_from().

    It seems you've got somewhat muddled -- you're actually introducing 
for_each_clear_bit() and for_each_clear_bit_from()

> They are similar to for_each_set_bit() and list_for_each_set_bit_from(),
> but they iterate over all the cleared bits in a memory region.

> Signed-off-by: Akinobu Mita<akinobu.mita@gmail.com>
> Cc: Robert Richter<robert.richter@amd.com>
> Cc: Thomas Gleixner<tglx@linutronix.de>
> Cc: Ingo Molnar<mingo@redhat.com>
> Cc: "H. Peter Anvin"<hpa@zytor.com>
> Cc: x86@kernel.org
> Cc: David Woodhouse<dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Cc: Martin Schwidefsky<schwidefsky@de.ibm.com>
> Cc: Heiko Carstens<heiko.carstens@de.ibm.com>
> Cc: linux390@de.ibm.com
> Cc: linux-s390@vger.kernel.org
> Cc: linux-usb@vger.kernel.org

WBR, Sergei
