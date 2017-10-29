Subject: Re: [PATCH v2 2/3] mtd: spi-nor: stm32-quadspi: fix prefetching
 outside fsize
To: Ludovic Barre <ludovic.Barre@st.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring
 <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <1509030755-19044-1-git-send-email-ludovic.Barre@st.com>
 <1509030755-19044-3-git-send-email-ludovic.Barre@st.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <d438795f-b5a5-b275-2058-ef48bc68fc2d@wedev4u.fr>
Date: Sun, 29 Oct 2017 18:57:37 +0100
MIME-Version: 1.0
In-Reply-To: <1509030755-19044-3-git-send-email-ludovic.Barre@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 26/10/2017 à 17:12, Ludovic Barre a écrit :
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> When memory-mapped mode is used, a prefetching mechanism fully
> managed by the hardware allows to optimize the read from external
> the QSPI memory. A 32-bytes FIFO is used for prefetching.
> When the limit of flash size - fifo size is reached the prefetching
> mechanism tries to read outside the fsize.
> The stm32 quadspi hardware become busy and should be aborted.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> Reported-by: Bruno Herrera <bruherrera@gmail.com>
> Tested-by: Bruno Herrera <bruherrera@gmail.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
