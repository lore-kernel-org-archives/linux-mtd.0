Subject: Re: [PATCH 04/11] pcmcia: do not use io_req_t after call to
	pcmcia_request_io()
From: Marcel Holtmann <marcel@holtmann.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
In-Reply-To: <1280667550-3040-4-git-send-email-linux@dominikbrodowski.net>
References: <20100801125749.GA2564@comet.dominikbrodowski.net>
	<1280667550-3040-4-git-send-email-linux@dominikbrodowski.net>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 01 Aug 2010 11:04:43 -0700
Message-ID: <1280685883.12579.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	linux-pcmcia@lists.infradead.org, linux-wireless@vger.kernel.org,
	laforge@gnumonks.org, linux-ide@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dominik,

> After pcmcia_request_io(), do not make use of the values stored in
> io_req_t, but instead use those found in struct pcmcia_device->resource[].
> 
> CC: netdev@vger.kernel.org
> CC: linux-wireless@vger.kernel.org
> CC: linux-ide@vger.kernel.org
> CC: linux-usb@vger.kernel.org
> CC: laforge@gnumonks.org
> CC: linux-mtd@lists.infradead.org
> CC: linux-bluetooth@vger.kernel.org
> CC: alsa-devel@alsa-project.org
> CC: linux-serial@vger.kernel.org
> Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

for the drivers/bluetooth/ pieces.

Acked-by: Marcel Holtmann <marcel@holtmann.org>

Regards

Marcel
