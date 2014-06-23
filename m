Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WyzjU-0000zg-Op
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 08:36:09 +0000
Received: by mail-wi0-f177.google.com with SMTP id r20so3620824wiv.16
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jun 2014 01:35:39 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 23 Jun 2014 01:35:39 -0700
Message-ID: <CAN0Jx-_+fEgpQVXopcXC_p+2ry_=TNGRkf5vbZ65WPRdUkJ8Jw@mail.gmail.com>
Subject: Open source Verilog BCH encoder/decoder
From: Russell Dill <Russ.Dill@asu.edu>
Content-Type: text/plain; charset=UTF-8
Cc: iverilog-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As part of my research, I needed a BCH encoder/decoder engine. Sadly,
such a thing has no existed under a permissive license. Even more
depressing is that many students seem to submit Verilog or VHDL
engines as a project (or even research), but never release anything
that is usable.

Anyway, I'm releasing a BSD licensed Verilog BCH encoder/decoder. It offers:

* Parallel input/output
* Modular components that can be shared across multiple decoders
* Automatic selection of BCH parameters based on data size and errors
to be corrected
* Specialized error locators for 1 error and 2 error codes
* Parallel or serial error polynomial generator for codes with 2 or more errors

https://github.com/russdill/bch_verilog

I'm releasing this under BSD because I'd like to see the code used as
widely as possible, but I'd still like to get feedback and hopefully
improvements merged back in.

As an example, a decoder for a 512 byte data block that corrects up to
12 errors with an 8 bit wide input and an 8 bit wide output currently
occupies 1635 slices and operates at up to 191 MHz on a Virtex-6
LX240T-3. Such a decoder would take input for 532 clock cycles (512
data bytes, 20 ecc bytes), calculate for about 28 clock cycles, and
then produce output for 512 clock cycles.

The code currently compiles on Icarus Verilog (latest git) and Xilinx
XST/Isim (tested with 14.5).
