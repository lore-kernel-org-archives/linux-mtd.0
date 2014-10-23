Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhCxN-0006a7-Jr
 for linux-mtd@lists.infradead.org; Thu, 23 Oct 2014 07:37:14 +0000
Received: by mail-pd0-f178.google.com with SMTP id y10so553479pdj.23
 for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2014 00:36:52 -0700 (PDT)
Date: Thu, 23 Oct 2014 00:36:48 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH v3] nandsim: add id_bytes module parameter
Message-ID: <20141023073648.GR16128@brian-ubuntu>
References: <1414021304-4644-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1414021304-4644-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 23, 2014 at 08:41:44AM +0900, Akinobu Mita wrote:
> nandsim can simulate NAND Flash which returns the ID bytes specified
> by first_id_byte, ..., fourth_id_byte module parameters.
> 
> In order to simulate NAND flash which returns more than four ID bytes,
> this adds id_bytes module parameter which is specified by the array of
> byte like this:
> 
>  # modprobe nandsim id_bytes=0x98,0xdc,0x90,0x26,0x76,0x15,0x01,0x08 bch=1
> 
> This doesn't add fifth_id_byte, ..., seventh_id_byte module parameters,
> because they are redundant.  But the existing first_id_byte, ...,
> fourth_id_byte module parameters are preserved and add "(obsolete)" to
> the description.
> 
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
> * v3
> - fix module parameter description for id_bytes, noticed by Brian

Pushed to l2-mtd.git. Thanks!

Brian
