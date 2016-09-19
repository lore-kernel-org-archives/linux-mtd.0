Received: from a.mx.sdesigns.eu ([78.31.43.6])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bm0wp-0005Ol-2x
 for linux-mtd@lists.infradead.org; Mon, 19 Sep 2016 15:57:40 +0000
Subject: Re: [PATCH v5] mtd: nand: tango: import driver for tango chips
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Sebastian Frias <sf84@laposte.net>,
 Jean-Baptiste Lescher <jblescher@gmail.com>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon> <57CD4672.1010504@free.fr>
 <20160905131516.0acb8145@bbrezillon> <57D189E1.3020508@sigmadesigns.com>
 <57D193C5.8040004@sigmadesigns.com> <57D2DF96.7060705@sigmadesigns.com>
 <57D5530B.2060209@free.fr> <20160912210810.79ac23c9@bbrezillon>
 <57DFE444.3000003@sigmadesigns.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <57E00ADD.5080807@sigmadesigns.com>
Date: Mon, 19 Sep 2016 17:57:17 +0200
MIME-Version: 1.0
In-Reply-To: <57DFE444.3000003@sigmadesigns.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19/09/2016 15:12, Marc Gonzalez wrote:

> Tests done to validate this driver:
>   mtd_stresstest dev=1 count=500000

# time modprobe mtd_stresstest dev=1 count=500000
[ 5872.077247] 
[ 5872.078768] =================================================
[ 5872.084628] mtd_stresstest: MTD device: 1
[ 5872.088707] mtd_stresstest: MTD device size 536870912, eraseblock size 131072, page size 2048, count of eraseblocks 4096, pages per eraseblock 64, OOB size 64
[ 5872.104813] mtd_test: scanning for bad eraseblocks
[ 5872.113166] mtd_test: scanned 4096 eraseblocks, 0 are bad
[ 5872.118624] mtd_stresstest: doing operations
[ 5872.122941] mtd_stresstest: 0 operations done
[ 5883.636505] mtd_stresstest: 1024 operations done
[ 5894.626418] mtd_stresstest: 2048 operations done
[ 5904.911443] mtd_stresstest: 3072 operations done
...
[10740.794754] mtd_stresstest: 499712 operations done
[10743.412941] mtd_stresstest: finished, 500000 operations done
[10743.418765] =================================================

real    81m11.354s
user    0m0.000s
sys     51m46.666s


>   mtd_nandbiterrs dev=1

# modprobe mtd_nandbiterrs dev=1
[11713.669415] 
[11713.670936] ==================================================
[11713.677186] mtd_nandbiterrs: MTD device: 1
[11713.681442] mtd_nandbiterrs: MTD device size 536870912, eraseblock=131072, page=2048, oob=64
[11713.690045] mtd_nandbiterrs: Device uses 1 subpages of 2048 bytes
[11713.696249] mtd_nandbiterrs: Using page=0, offset=0, eraseblock=0
[11713.703241] mtd_nandbiterrs: incremental biterrors test
[11713.708608] mtd_nandbiterrs: write_page
[11713.712783] mtd_nandbiterrs: rewrite page
[11713.717164] mtd_nandbiterrs: read_page
[11713.721166] mtd_nandbiterrs: verify_page
[11713.725180] mtd_nandbiterrs: Successfully corrected 0 bit errors per subpage
[11713.732360] mtd_nandbiterrs: Inserted biterror @ 0/5
[11713.737403] mtd_nandbiterrs: rewrite page
[11713.741760] mtd_nandbiterrs: read_page
[11713.745749] mtd_nandbiterrs: verify_page
[11713.749805] mtd_nandbiterrs: Successfully corrected 1 bit errors per subpage
[11713.756947] mtd_nandbiterrs: Inserted biterror @ 0/2
[11713.761990] mtd_nandbiterrs: rewrite page
[11713.766340] mtd_nandbiterrs: read_page
[11713.770331] mtd_nandbiterrs: verify_page
[11713.774382] mtd_nandbiterrs: Successfully corrected 2 bit errors per subpage
[11713.781524] mtd_nandbiterrs: Inserted biterror @ 0/0
[11713.786565] mtd_nandbiterrs: rewrite page
[11713.790917] mtd_nandbiterrs: read_page
[11713.794881] mtd_nandbiterrs: verify_page
[11713.798887] mtd_nandbiterrs: Successfully corrected 3 bit errors per subpage
[11713.805985] mtd_nandbiterrs: Inserted biterror @ 1/7
[11713.810985] mtd_nandbiterrs: rewrite page
[11713.815299] mtd_nandbiterrs: read_page
[11713.819240] mtd_nandbiterrs: verify_page
[11713.823253] mtd_nandbiterrs: Successfully corrected 4 bit errors per subpage
[11713.830351] mtd_nandbiterrs: Inserted biterror @ 1/5
[11713.835350] mtd_nandbiterrs: rewrite page
[11713.839654] mtd_nandbiterrs: read_page
[11713.843601] mtd_nandbiterrs: verify_page
[11713.847608] mtd_nandbiterrs: Successfully corrected 5 bit errors per subpage
[11713.854705] mtd_nandbiterrs: Inserted biterror @ 1/2
[11713.859700] mtd_nandbiterrs: rewrite page
[11713.864018] mtd_nandbiterrs: read_page
[11713.867961] mtd_nandbiterrs: verify_page
[11713.871972] mtd_nandbiterrs: Successfully corrected 6 bit errors per subpage
[11713.879071] mtd_nandbiterrs: Inserted biterror @ 1/0
[11713.884069] mtd_nandbiterrs: rewrite page
[11713.888375] mtd_nandbiterrs: read_page
[11713.892321] mtd_nandbiterrs: verify_page
[11713.896327] mtd_nandbiterrs: Successfully corrected 7 bit errors per subpage
[11713.903424] mtd_nandbiterrs: Inserted biterror @ 2/6
[11713.908421] mtd_nandbiterrs: rewrite page
[11713.912731] mtd_nandbiterrs: read_page
[11713.916671] mtd_nandbiterrs: verify_page
[11713.920681] mtd_nandbiterrs: Successfully corrected 8 bit errors per subpage
[11713.927788] mtd_nandbiterrs: Inserted biterror @ 2/5
[11713.932787] mtd_nandbiterrs: rewrite page
[11713.937092] mtd_nandbiterrs: read_page
[11713.941038] mtd_nandbiterrs: verify_page
[11713.945046] mtd_nandbiterrs: Successfully corrected 9 bit errors per subpage
[11713.952143] mtd_nandbiterrs: Inserted biterror @ 2/2
[11713.957138] mtd_nandbiterrs: rewrite page
[11713.961448] mtd_nandbiterrs: read_page
[11713.965388] mtd_nandbiterrs: verify_page
[11713.969402] mtd_nandbiterrs: Successfully corrected 10 bit errors per subpage
[11713.976584] mtd_nandbiterrs: Inserted biterror @ 2/0
[11713.981582] mtd_nandbiterrs: rewrite page
[11713.985886] mtd_nandbiterrs: read_page
[11713.989832] mtd_nandbiterrs: verify_page
[11713.993837] mtd_nandbiterrs: Successfully corrected 11 bit errors per subpage
[11714.001022] mtd_nandbiterrs: Inserted biterror @ 3/7
[11714.006017] mtd_nandbiterrs: rewrite page
[11714.010352] mtd_nandbiterrs: read_page
[11714.014351] mtd_nandbiterrs: verify_page
[11714.018371] mtd_nandbiterrs: Successfully corrected 12 bit errors per subpage
[11714.025554] mtd_nandbiterrs: Inserted biterror @ 3/6
[11714.030557] mtd_nandbiterrs: rewrite page
[11714.034867] mtd_nandbiterrs: read_page
[11714.038817] mtd_nandbiterrs: verify_page
[11714.042827] mtd_nandbiterrs: Successfully corrected 13 bit errors per subpage
[11714.050012] mtd_nandbiterrs: Inserted biterror @ 3/5
[11714.055009] mtd_nandbiterrs: rewrite page
[11714.059361] mtd_nandbiterrs: read_page
[11714.063301] mtd_nandbiterrs: verify_page
[11714.067312] mtd_nandbiterrs: Successfully corrected 14 bit errors per subpage
[11714.074496] mtd_nandbiterrs: Inserted biterror @ 3/2
[11714.079495] mtd_nandbiterrs: rewrite page
[11714.083801] mtd_nandbiterrs: read_page
[11714.093403] mtd_nandbiterrs: error: read failed at 0x0
[11714.098578] mtd_nandbiterrs: After 15 biterrors per subpage, read reported error -74
[11714.106779] mtd_nandbiterrs: finished successfully.
[11714.111691] ==================================================


>   ubiattach -m 1 -d 3 && runtests.sh /dev/ubi3

# time ./runtests.sh /dev/ubi3
Running mkvol_basic /dev/ubi3
Running mkvol_bad /dev/ubi3
[ 2319.279975] ubi3 error: ubi_cdev_ioctl [ubi]: bad volume creation request
[ 2319.286844] Volume creation request dump:
[ 2319.291238]  vol_id    -2
[ 2319.294023]  alignment 1
[ 2319.296649]  bytes     509427712
[ 2319.299956]  vol_type  3
[ 2319.302498]  name_len  22
[ 2319.305216]  1st 16 characters of name: mkvol_bad:test_m
[ 2319.310672] ubi3 error: ubi_cdev_ioctl [ubi]: bad volume creation request
[ 2319.317571] Volume creation request dump:
[ 2319.321662]  vol_id    128
[ 2319.324440]  alignment 1
[ 2319.327042]  bytes     509427712
[ 2319.330341]  vol_type  3
[ 2319.332882]  name_len  22
[ 2319.335594]  1st 16 characters of name: mkvol_bad:test_m
[ 2319.341023] ubi3 error: ubi_cdev_ioctl [ubi]: bad volume creation request
[ 2319.347871] Volume creation request dump:
[ 2319.351912]  vol_id    0
[ 2319.354466]  alignment 0
[ 2319.357024]  bytes     509427712
[ 2319.360277]  vol_type  3
[ 2319.362825]  name_len  22
[ 2319.365464]  1st 16 characters of name: mkvol_bad:test_m
[ 2319.370837] ubi3 error: ubi_cdev_ioctl [ubi]: bad volume creation request
[ 2319.377677] Volume creation request dump:
[ 2319.381716]  vol_id    0
[ 2319.384270]  alignment -1
[ 2319.386910]  bytes     509427712
[ 2319.390163]  vol_type  3
[ 2319.392704]  name_len  22
[ 2319.395343]  1st 16 characters of name: mkvol_bad:test_m
[ 2319.400713] ubi3 error: ubi_cdev_ioctl [ubi]: bad volume creation request
[ 2319.407554] Volume creation request dump:
[ 2319.411593]  vol_id    0
[ 2319.414148]  alignment 126977
[ 2319.417139]  bytes     509427712
[ 2319.420393]  vol_type  3
[ 2319.422934]  name_len  22
[ 2319.425573]  1st 16 characters of name: mkvol_bad:test_m
[ 2319.430944] ubi3 error: ubi_cdev_ioctl [ubi]: bad volume creation request
[ 2319.437783] Volume creation request dump:
[ 2319.441822]  vol_id    0
[ 2319.444377]  alignment 2049
[ 2319.447193]  bytes     509427712
[ 2319.450446]  vol_type  3
[ 2319.452987]  name_len  22
[ 2319.455627]  1st 16 characters of name: mkvol_bad:test_m
[ 2319.460997] ubi3 error: ubi_cdev_ioctl [ubi]: bad volume creation request
[ 2319.467843] Volume creation request dump:
[ 2319.471883]  vol_id    0
[ 2319.474438]  alignment 1
[ 2319.476992]  bytes     -1
[ 2319.479620]  vol_type  3
[ 2319.482174]  name_len  22
[ 2319.484811]  1st 16 characters of name: mkvol_bad:test_m
[ 2319.490188] ubi3 error: ubi_cdev_ioctl [ubi]: bad volume creation request
[ 2319.497026] Volume creation request dump:
[ 2319.501066]  vol_id    0
[ 2319.503624]  alignment 1
[ 2319.506164]  bytes     0
[ 2319.508718]  vol_type  3
[ 2319.511273]  name_len  22
[ 2319.513912]  1st 16 characters of name: mkvol_bad:test_m
[ 2319.519288] ubi3 error: ubi_create_volume [ubi]: not enough PEBs, only 4012 available
[ 2319.527183] ubi3 error: ubi_create_volume [ubi]: cannot create volume 0, error -28
[ 2319.534830] ubi3 error: ubi_create_volume [ubi]: not enough PEBs, only 4012 available
[ 2319.542721] ubi3 error: ubi_create_volume [ubi]: cannot create volume 0, error -28
[ 2319.550365] ubi3 error: ubi_cdev_ioctl [ubi]: bad volume creation request
[ 2319.557205] Volume creation request dump:
[ 2319.561244]  vol_id    0
[ 2319.563800]  alignment 1
[ 2319.566345]  bytes     126976
[ 2319.569337]  vol_type  7
[ 2319.571891]  name_len  22
[ 2319.574531]  1st 16 characters of name: mkvol_bad:test_m
[ 2319.688559] ubi3 error: ubi_create_volume [ubi]: volume 0 already exists
[ 2319.695328] ubi3 error: ubi_create_volume [ubi]: cannot create volume 0, error -17
[ 2319.702987] ubi3 error: ubi_create_volume [ubi]: volume "mkvol_bad:test_mkvol()" exists (ID 0)
[ 2319.711676] ubi3 error: ubi_create_volume [ubi]: cannot create volume 1, error -17
[ 2319.936067] ubi3 error: ubi_create_volume [ubi]: volume "mkvol_bad:test_mkvol()" exists (ID 0)
[ 2319.944757] ubi3 error: ubi_create_volume [ubi]: cannot create volume 1, error -17
[ 2347.540770] ubi3 error: ubi_unregister_volume_notifier [ubi]: cannot open device 3, volume 128, error -22
[ 2347.550452] ubi3 error: ubi_unregister_volume_notifier [ubi]: cannot open device 3, volume -1, error -22
[ 2347.560458] ubi3 error: ubi_unregister_volume_notifier [ubi]: cannot open device 3, volume 128, error -22
[ 2347.570244] ubi3 error: ubi_unregister_volume_notifier [ubi]: cannot open device 3, volume 0, error -19
[ 2347.798164] ubi3 error: ubi_unregister_volume_notifier [ubi]: cannot open device 3, volume 0, error -19
Running mkvol_paral /dev/ubi3
Running rsvol /dev/ubi3
Running io_basic /dev/ubi3
Running io_read /dev/ubi3
Running io_update /dev/ubi3
Running io_paral /dev/ubi3
Running volrefcnt /dev/ubi3
SUCCESS

real    40m16.730s
user    11m33.653s
sys     20m57.187s



NB: Richard also suggested running a decent filesystem load using bonnie++
