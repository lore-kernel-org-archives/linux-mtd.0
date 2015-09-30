Date: Wed, 30 Sep 2015 11:28:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: sunxi: rework macros
Message-ID: <20150930182840.GG143959@google.com>
References: <1442389597-30698-1-git-send-email-boris.brezillon@free-electrons.com>
 <1442389597-30698-2-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442389597-30698-2-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 16, 2015 at 09:46:36AM +0200, Boris Brezillon wrote:
> Suffix mask macros with _MSK and add new helper macros to avoid manually
> shifting values.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Pushed patch 1 to l2-mtd.git
