From: Julia Lawall <Julia.Lawall@lip6.fr>
To: linux-input@vger.kernel.org
Subject: [PATCH 0/25] fix error return code
Date: Sun, 29 Dec 2013 23:47:15 +0100
Message-Id: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: cbe-oss-dev@lists.ozlabs.org,
 davinci-linux-open-source@linux.davincidsp.com,
 linux-pcmcia@lists.infradead.org, rtc-linux@googlegroups.com,
 linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patches fix cases where the return variable is not set to an error
code in an error case.
