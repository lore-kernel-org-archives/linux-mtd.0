Subject: Re: [PATCH v6 0/4] ARM: Add support for CONFIG_DEBUG_VIRTUAL
To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will.deacon@arm.com
References: <20170104011417.1496-1-f.fainelli@gmail.com>
 <20170104223955.22859-1-f.fainelli@gmail.com>
Cc: linux@armlinux.org.uk, nicolas.pitre@linaro.org, panand@redhat.com,
 chris.brandt@renesas.com, arnd@arndb.de, jonathan.austin@arm.com,
 pawel.moll@arm.com, vladimir.murzin@arm.com, mark.rutland@arm.com,
 ard.biesheuvel@linaro.org, keescook@chromium.org, matt@codeblueprint.co.uk,
 labbott@fedoraproject.org, kirill.shutemov@linux.intel.com,
 ben@decadent.org.uk, js07.lee@samsung.com, stefan@agner.ch,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 cyrille.pitchen@atmel.com, richard@nod.at,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f7ff1040-20da-4ccf-411a-a665f07286c0@gmail.com>
Date: Sat, 14 Jan 2017 19:01:16 -0800
MIME-Version: 1.0
In-Reply-To: <20170104223955.22859-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 01/04/17 à 14:39, Florian Fainelli a écrit :
> This patch series builds on top of Laura's [PATCHv6 00/10] CONFIG_DEBUG_VIRTUAL
> for arm64 to add support for CONFIG_DEBUG_VIRTUAL for ARM.
> 
> This was tested on a Brahma B15 platform (ARMv7 + HIGHMEM + LPAE).
> 
> Note that the treewide changes would involve a huge CC list, which
> is why it has been purposely trimmed to just focusing on the DEBUG_VIRTUAL
> aspect.
> 
> Catalin, provided that you take Laura's series, I suppose I would submit
> this one through Russell's patch system if that's okay with everyone?

Submitted through Russell's patch tracking system as #8638-8641
-- 
Florian
