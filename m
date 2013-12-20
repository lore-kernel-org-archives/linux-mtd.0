Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vtvgq-00033v-Ng
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 08:44:13 +0000
Message-ID: <52B402AF.8090700@openwrt.org>
Date: Fri, 20 Dec 2013 09:41:19 +0100
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V2 3/8] mtd: lantiq-flash: Use devm_kzalloc()
References: <000d01cefd55$7e48a2a0$7ad9e7e0$%han@samsung.com>
 <001001cefd55$aa828110$ff878330$%han@samsung.com>
In-Reply-To: <001001cefd55$aa828110$ff878330$%han@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Thomas Langer' <thomas.langer@lantiq.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20/12/13 08:32, Jingoo Han wrote:
> Use devm_kzalloc() to make cleanup paths simpler.
>
> Signed-off-by: Jingoo Han<jg1.han@samsung.com>

Hi,

Acked-by: John Crispin <blogic@openwrt.org>

Thanks for the clean up !

     John
