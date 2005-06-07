Received: from mgw-ext01.nokia.com ([131.228.20.93])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DfcFI-00059m-7v
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2005 07:27:49 -0400
Date: Tue, 7 Jun 2005 14:10:24 +0300
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Munira Ahmed <munira.ahmed@radixs.com>
Message-ID: <20050607111023.GA10305@angel.research.nokia.com>
References: <1118136773.11408.50.camel@server11>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1118136773.11408.50.camel@server11>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: mkfs.jffs2
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 07, 2005 at 05:32:53PM +0800, ext Munira Ahmed wrote:
> Is there any manual page or tutorial on mk.jffs2 on the net. it
seems

Run mkfs.jffs2 without an argument to print its usage? (Sample below)

For example, I use following command for Nokia 770 test board with
Samsung 1Gbit chip with 128KiB erase block size. I create the image
without cleanmarkers because that is the way how N770's bootloader
engulfs the JFFS2 image to be flashed.

  $ mkfs.jffs2 -r srcdir -o imagefile -e 128 -l -n


Jarkko Lavinen


$ ./mkfs.jffs2
mkfs.jffs2: Usage: mkfs.jffs2 [OPTIONS]
Make a JFFS2 file system image from an existing directory tree

Options:
  -p, --pad[=SIZE]        Pad output to SIZE bytes with 0xFF. If SIZE is
                          not specified, the output is padded to the end of
                          the final erase block
  -r, -d, --root=DIR      Build file system from directory DIR (default: cwd)
  -s, --pagesize=SIZE     Use page size (max data node size) SIZE (default: 4KiB)
  -e, --eraseblock=SIZE   Use erase block size SIZE (default: 64KiB)
  -c, --cleanmarker=SIZE  Size of cleanmarker (default 12)
  -m, --compr-mode=MODE   Select compression mode (default: priortiry)
  -x, --disable-compressor=COMPRESSOR_NAME
                          Disable a compressor
  -X, --enable-compressor=COMPRESSOR_NAME
                          Enable a compressor
  -y, --compressor-priority=PRIORITY:COMPRESSOR_NAME
                          Set the priority of a compressor
  -L, --list-compressors  Show the list of the avaiable compressors
  -t, --test-compression  Call decompress and compare with the original (for test)
  -n, --no-cleanmarkers   Don't add a cleanmarker to every eraseblock
  -o, --output=FILE       Output to FILE (default: stdout)
  -l, --little-endian     Create a little-endian filesystem
  -b, --big-endian        Create a big-endian filesystem
  -D, --devtable=FILE     Use the named FILE as a device table file
  -f, --faketime          Change all file times to '0' for regression testing
  -q, --squash            Squash permissions and owners making all files be owned by root
  -U, --squash-uids       Squash owners making all files be owned by root
  -P, --squash-perms      Squash permissions on all files
  -h, --help              Display this help text
  -v, --verbose           Verbose operation
  -V, --version           Display version information
  -i, --incremental=FILE  Parse FILE and generate appendage output for it




> that everything is inherently known to the community without proper
> documentation or manuals. I can't find any decent document that could
> give me a start.
> 
> 
> Where do I learn about jffs2 and mk.jffs2
> 
> 
> 
> -- 
> Munira Ahmed
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
