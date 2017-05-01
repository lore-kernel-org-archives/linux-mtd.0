Date: Mon, 1 May 2017 16:44:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Andres Galacho <andresgalacho@gmail.com>
Cc: linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 richard@nod.at, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, marc_gonzalez@sigmadesigns.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: tango: Export OF device ID table as module
 aliases
Message-ID: <20170501234432.GA18576@google.com>
References: <20170501203015.7275-1-andresgalacho@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170501203015.7275-1-andresgalacho@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 01, 2017 at 04:30:15PM -0400, Andres Galacho wrote:
> The device table is required to load modules based on
> modaliases. After adding MODULE_DEVICE_TABLE, below entries
> for example will be added to module.alias:
> alias:          of:N*T*Csigma,smp8758-nandC*
> alias:          of:N*T*Csigma,smp8758-nand
> 
> Signed-off-by: Andres Galacho <andresgalacho@gmail.com>

Acked-by: Brian Norris <computersforpeace@gmail.com>
